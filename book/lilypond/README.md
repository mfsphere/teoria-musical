# Partituras

Fontes LilyPond do livro, em `\version "2.26.0"`. Cada ficheiro gera um SVG em
`public/scores/` e, quando tem instrumento atribuído em `book/book.json`, também
um MP3 em `public/audio/`.

Compilar tudo: `pnpm run build:scores`.

## Ficheiros de terceiros

`roman_numeral_analysis_tool.ily` é código de terceiros, usado sem alterações.

| Campo   | Valor                                                          |
| ------- | -------------------------------------------------------------- |
| Origem  | <https://github.com/davidnalesnik/lilypond-roman-numeral-tool> |
| Commit  | `40103603d20c87b98d66bd1d5dbb6ad12b7c1c92` (2025-07-01)        |
| Licença | MIT — ver `license-roman-numeral-tool.md`                      |

Mantém `\version "2.18"`, tal como a montante. **Não correr `convert-ly` sobre
este ficheiro nem editá-lo**: para atualizar, buscar de novo a versão a montante.
