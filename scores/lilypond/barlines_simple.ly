\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

sopranoVoice = \relative c'' {
  \global
  % barras simples
  a2 g2 \bar "|"

  % barras duplas
  f2  e2 \bar "||"
  d2 c2 \bar "|."
}

verse = \lyricmode {
  \override LyricText.self-alignment-X = #LEFT

  \set stanza = "Exemplo n.º:"

  \skip 1 "1. Barra simples"
  \skip 1 "2. Barra dupla"
  \skip 1 "3. Barra final"
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi { \tempo 4 = 100 }
}
