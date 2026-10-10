\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \key c \major
  \time 64/4
}

sopranoVoice = \relative c' {
  \global
  <c c>1
  <c des>
  <c d!>
  <c ees>
  <c e!>
  <c fes>
  <c f!>
  <c fis>
  <c ges'>
  <c g'!>
  <c gis'>
  <c aes'>
  <c a'!>
  <c bes'>
  <c b'!>
  <c c'>

  \bar "|."
}

verse = \lyricmode {
  "P1" "m2" "M2" "m3" "M3" "d4" "P4" "A4" "d5" "P5" "A5" "m6" "M6" "m7" "M7" "P8"
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi { \tempo 4 = 160 }
}
