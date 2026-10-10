\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.SystemStartBar
  \omit Score.TimeSignature

  \key c \major
  \time 8/4
}

violin = \relative c {
  \global

  \clef treble

  f1 _\markup { \halign #-0.70 F3 }^\markup { Contralto }
  d''^\markup { \halign #-0.70 D5 }

  a, _\markup { \halign #-0.70 A3 }^\markup { \left-column { Meio Soprano } }
  f''^\markup { \halign #-0.70 F5 }

  c, _\markup { \halign #-0.70 C4 }^\markup { Soprano }
  a''^\markup { \halign #-0.70 A5 }

  \bar "|."
}

contrabass = \relative c {
  \global

  \clef bass

  e, _\markup { \halign #-0.70 E2 }^\markup { Baixo }
  c''^\markup { \halign #-0.70 C4 }

  g, _\markup { \halign #-0.70 G2 }^\markup { Barítono }
  e''^\markup { \halign #-0.70 E4 }

  b, _\markup { \halign #-0.70 B2 }^\markup { Tenor }
  g''^\markup { \halign #-0.70 G4 }

  \bar "|."
}

\score {
  <<
    \violin
    \contrabass
  >>
  \layout {
    \context {
      \Staff
      \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #15
    }
  }
}
