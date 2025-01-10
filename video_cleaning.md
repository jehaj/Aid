You can use ffmpeg in the terminal to clean noise from a video and normalize the audio level. There are many different ways to remove noise, but one I have found works well in practice is using a ML model to remove it.

With the command
```
ffmpeg -i input.mp4 -af arnndn=m=cb.rnnn output.mp4
```
to use this you must have previously downloaded `cb.rnnn` from [github.com](https://github.com/GregorR/rnnoise-models/tree/master), where cb stands for conjoined-burgers.

To normalize audio level use
```
ffmpeg -i input.mp4 -af loudnorm=i=-14:LRA=11:TP=-1 output.mp4
```

Perhaps do both of them at the same time with
```
ffmpeg -i input.mp4 -af "arnndn=m=cb.rnnn, loudnorm=i=-14:LRA=11:TP=-1" output.mp4
```

