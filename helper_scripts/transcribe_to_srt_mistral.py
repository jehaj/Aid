import os
import re
import sys
import subprocess
import tempfile
from pathlib import Path
from mistralai.client import Mistral

def extract_audio(video_path: Path, output_audio_path: Path) -> None:
    """Extracts mono 16kHz MP3 audio from a video using ffmpeg."""
    command = [
        "ffmpeg",
        "-y",               # Overwrite without asking
        "-i", str(video_path),
        "-vn",              # Disable video stream
        "-acodec", "libmp3lame",
        "-ar", "16000",     # 16kHz sample rate optimal for speech recognition
        "-ac", "1",         # Mono audio to minimize upload payload size
        "-q:a", "4",
        str(output_audio_path)
    ]
    
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"FFmpeg failed with error:\n{result.stderr}")

def clean_srt_response(raw_text: str) -> str:
    """Strips Markdown fences or preamble if the LLM includes them."""
    # Remove markdown code fences like ```srt ... ``` or ``` ... ```
    cleaned = re.sub(r"^```(?:srt)?\s*", "", raw_text.strip(), flags=re.IGNORECASE)
    cleaned = re.sub(r"\s*```$", "", cleaned.strip())
    return cleaned.strip() + "\n"

def video_to_srt(video_path_str: str, output_srt_str: str = None) -> Path:
    video_path = Path(video_path_str).resolve()
    if not video_path.exists():
        raise FileNotFoundError(f"Video file not found: {video_path}")

    # Determine default SRT output path if not specified
    if output_srt_str:
        srt_path = Path(output_srt_str).resolve()
    else:
        srt_path = video_path.with_suffix(".srt")

    api_key = os.environ.get("MISTRAL_API_KEY")
    if not api_key:
        raise ValueError("MISTRAL_API_KEY environment variable is not set.")

    client = Mistral(api_key=api_key)
    model = "voxtral-small-latest"

    # Use a temporary directory to store intermediate extracted audio
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_audio = Path(temp_dir) / f"{video_path.stem}.mp3"
        print(f"[1/4] Extracting audio from '{video_path.name}' with ffmpeg...")
        extract_audio(video_path, temp_audio)

        print("[2/4] Uploading audio to Mistral...")
        with open(temp_audio, "rb") as f:
            uploaded_audio = client.files.upload(
                file={
                    "content": f,
                    "file_name": temp_audio.name
                },
                purpose="audio"
            )

        print("[3/4] Generating signed URL and requesting SRT transcription...")
        signed_url = client.files.get_signed_url(file_id=uploaded_audio.id)

        prompt = (
            "Transcribe this audio into a valid SRT (SubRip) format.\n"
            "Requirements:\n"
            "1. Output ONLY standard SRT format (sequence number, 00:00:00,000 --> 00:00:00,000, and subtitle text).\n"
            "2. Align timestamps accurately with spoken dialogue.\n"
            "3. Do not include markdown code block backticks (```), explanations, conversational remarks, or preamble."
        )

        messages = [
            {
                "role": "user",
                "content": [
                    {
                        "type": "input_audio",
                        "input_audio": signed_url.url,
                    },
                    {
                        "type": "text",
                        "text": prompt
                    }
                ]
            }
        ]

        response = client.chat.complete(
            model=model,
            messages=messages,
            temperature=0.0
        )

        # Cleanup remote file
        try:
            client.files.delete(file_id=uploaded_audio.id)
        except Exception:
            pass

    print("[4/4] Writing subtitles to disk...")
    raw_content = response.choices[0].message.content
    srt_content = clean_srt_response(raw_content)

    with open(srt_path, "w", encoding="utf-8") as srt_file:
        srt_file.write(srt_content)

    print(f"Done! Subtitles saved to: {srt_path}")
    return srt_path

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python transcribe_to_srt.py <path_to_video> [path_to_output.srt]")
        sys.exit(1)

    input_video = sys.argv[1]
    output_srt = sys.argv[2] if len(sys.argv) > 2 else None
    video_to_srt(input_video, output_srt)
