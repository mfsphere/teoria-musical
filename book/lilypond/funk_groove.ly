\version "2.26.0"

\include "global.ily"

global = {
  \key e \minor
  \numericTimeSignature
  \time 4/4
  \tempo "Funk" 4 = 120
}

%% Baixo eléctrico: groove em semicolcheias, com notas curtas e destacadas,
%% como se toca em funk. Escrito à altura real, em clave de fá.
bassGroove = \absolute {
  \global

  e,16-.\mf r16 r8 e,16-. r16 r8 e,16-. r16 r16 e16-> r16 e,16-. d16 e16 |
  g,16->\f r16 g16 r16 g,16-> r16 g16 r16 a,16-> r16 r16 a16 r16 a,16-. g16 a16 |

  \bar "|."
}

%% Piano: acordes curtos nos contratempos, deixando o baixo à frente.
right = \relative c' {
  \global

  r8 <g' b e>8-.\mp r8 <g b e>8-. r4 r8 <g b e>8-. |
  r8 <b d g>8-. r8 <b d g>8-. r8 <c e a>8-. r8 <c e a>8-. |

  \bar "|."
}

left = \relative c {
  \global

  e4\p ~ e2. |
  g4 ~ g2 a4 |

  \bar "|."
}

\score {
  <<
    \new ChordNames \chordmode { e1:m7 | g2 a2:m7 }

    \new PianoStaff \with { instrumentName = "Piano" } <<
      \new Staff = "right" \right
      \new Staff = "left" { \clef bass \left }
    >>

    \new Staff \with {
      instrumentName = "Baixo"
      midiInstrument = "electric bass (finger)"
    } { \clef bass \bassGroove }
  >>
  \layout { }
  \midi { }
}
