\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

linhas = \relative c {
  \global
  d2 e a b
  \bar "||"

  b'' c f g
  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Notas:"
  "D3" "E3" "A3" "B3" "B5" "C6" "F6" "G6"
}

verseTwo = \lyricmode {
  \set stanza = "Exemplo n.º:"
  "1" "2" "3" "4" "5" "6" "7" "8"
}

\score {
  \new Staff { \linhas }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
}
