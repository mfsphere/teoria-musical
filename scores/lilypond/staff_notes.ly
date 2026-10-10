\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \key c \major
  \time 36/4
}

notas = \relative c' {
  \global
  e1 g b d f \bar "||"
  f, a c e \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "PT:"
  Mi Sol Si Ré Fá
  Fá Lá Dó Mi
}

verseTwo = \lyricmode {
  \set stanza = "SPN:"
  "E4" "G4" "B4" "D5" "F5"
  "F4" "A4" "C5" "E5"
}

\score {
  \new Staff { \notas }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
}
