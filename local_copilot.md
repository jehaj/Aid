# Lokal Copilot
Jeg har brugt
- `ollama`
- `twinny`

## ollama
ollama bruges til at hente og køre LLMer lokalt. En nem måde at hente det på er `scoop install ollama`. Hvis man ikke bruger `scoop`, så konsulter [github.com/ollama](https://github.com/ollama/ollama#ollama). Dernæst kør følgende
```bash
> ollama serve &
> ollama pull starcoder2
```
Perfekt :)

## twinny
Dette er en udvidelse til bl.a. VSCode. Hent den i VSCode i `Extensions` vinduet. Indstil `twinny` *providers* ved at trykke på den rigtige knap (stikket) i øverste del af *twinny*s vindue (skulle meget gerne være i venstre side et sted under `Extensions`). Slet de to, der var der i forvejen. Tilføj en ny ved *Add provider* og brug de anbefalede indstillinger. `starcoder2` er en FIM type LLM.

Det burde nu virke, når du har skrevet og holder pause. Ellers tryk `ALT + ½` og den burde vise et forslag :)
