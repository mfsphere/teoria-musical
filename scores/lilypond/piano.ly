\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

right = \relative c' {
  \global
  <d f a>2
  <d g b>2
  <e g c>1

  \bar "|."
}

left = \relative c {
  \global
  d2
  g2
  c,1

  \bar "|."
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \right
    \new Staff = "left" { \clef bass \left }
  >>
  \layout {
    ragged-last = ##t
  }
  \midi { \tempo 4 = 66 }
}
