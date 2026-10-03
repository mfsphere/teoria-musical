\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \key c \major
  \time 32/4
}

sopranoVoice = \relative c' {
  \global
  <c c>1
  <c d>
  <c e>
  <c f>
  <c g'>
  <c a'>
  <c b'>
  <c c'>

  \bar "|."
}

verse = \lyricmode {
  "P1" "M2" "M3" "P4" "P5" "M6" "M7" "P8"
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi { \tempo 4 = 160 }
}
