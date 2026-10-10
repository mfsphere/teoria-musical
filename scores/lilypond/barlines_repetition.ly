\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

sopranoVoice = \relative c'' {
  \global

  % Barras duplas de repetição
  c2 g2 \bar ".|:-|"
  e2  g2 \bar ":..:"
  b2 d2 \bar ":|."
}

verse = \lyricmode {
  \override LyricText.self-alignment-X = #LEFT

  \set stanza = "Exemplo n.º:"

  \skip 1 \markup { \center-column { "4. Barra de repetição" "à esquerda" } }
  \skip 1 \markup { \center-column { "5. Barra de repetição" "à esquerda e direita" } }
  \skip 1 \markup { \center-column { "6. Barra de repetição" "à direita" } }
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi { \tempo 4 = 100 }
}
