\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \set Score.measureBarType = #'()

  \set melismaBusyProperties = #'()
  \slurDown
  \slurDashed

  \key c \major
  \time 4/4
}

sopranoVoice = \relative c' {
  \global

  \repeat unfold 14 { s1 }
  c d e (f) g a b
  (c) d e (f) g a b (c)

  \bar "||"
}

verseSopranoVoice = \lyricmode {
  "[C4]" "D4" "E4" "F4" "G4" "A4" "B4"
  "[C5]" "D5" "E5" "F5" "G5" "A5" "B5" "[C6]"
}

bassVoice = \relative c, {
  \global

  c d e (f) g a b
  (c) d e (f) g a b (c)
  \repeat unfold 14 { s1 }
}

verseBassVoice = \lyricmode {
  "[C2]" "D2" "E2" "F2" "G2" "A2" "B2"
  "[C3]" "D3" "E3" "F3" "G3" "A3" "B3" "[C4]"
}

sopranoVoicePart = \new Staff { \sopranoVoice }
\addlyrics { \verseSopranoVoice }

bassVoicePart = \new Staff { \clef bass \bassVoice }
\addlyrics { \verseBassVoice }

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \sopranoVoicePart
    \bassVoicePart
  >>
  \layout {
    \override Score.LyricText.font-size = #-1
  }
  \midi { \tempo 4 = 200 }
}
