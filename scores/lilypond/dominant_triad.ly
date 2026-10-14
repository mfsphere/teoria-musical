\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

right = \relative c'' {
  \global
  \set glissandoMap = #'((1 . 1))
  <g b>1\glissando
  <g c>1

  \bar "|."
}

left = \relative c' {
  \global
  <g d'>1\glissando
  <c, e'>1

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = \markup \keyIndication { C }
  \markup \rN { V }
  \markup \rN { I }
}

\score {
  \new PianoStaff
  <<
    \new Staff = "right" \right
    \new Staff = "left" { \clef bass \left }

    \addlyrics {
      \verseOne
    }
  >>
  \layout { }
  \midi { \tempo 4 = 100 }
}
