\version "2.26.0"

\include "global.ily"

\paper {
  #(include-special-characters)
}

\score {
  <<
    \new RhythmicStaff \with {
      instrumentName = \markup {
        \right-column {
          Compasso composto:
        }
      }
    } {
      \new Voice = "myRhythm" {
        \set Staff.midiInstrument = "woodblock"
        \numericTimeSignature

        \time 12/8
        \repeat unfold 12 { c8 }

        \time 9/8
        r8 c8 c8
        c8 r8 c8
        c8 c8 r8

        \time 6/8
        c4 c4 c4
      }

      \bar "||"
    }

    \new RhythmicStaff \with {  instrumentName = #"Pulsos:" } {
      \new Voice = "myPulses" {
        %% A RhythmicStaff draws one line whatever the pitch, so the three
        %% layers are separated by octave to be told apart by ear.
        \set Staff.midiInstrument = "woodblock"
        \numericTimeSignature

        \time 12/8
        c,,4. c,,4. c,,4. c,,4.

        \time 9/8
        c,,4. c,,4. c,,4.

        \time 6/8
        c,,4. c,,4.
      }

      \bar "||"
    }

    \new RhythmicStaff \with {
      instrumentName = \markup {
        \right-column {
          "Divisão do" "pulso:"
        }
      }
    } {
      \new Voice = "myPulsesDivision" {
        \set Staff.midiInstrument = "woodblock"
        \numericTimeSignature

        \time 12/8
        \repeat unfold 12 { c''8 }

        \time 9/8
        \repeat unfold 9 { c''8 }

        \time 6/8
        \repeat unfold 6 { c''8 }
      }

      \bar "||"
    }

    \new Lyrics {
      \lyricsto "myPulses" {
        \set stanza = #"Pulso:"
        "1" "2" "3" "4"
        "1" "2" "3"
        "1" "2"
      }
    }

    \new Lyrics {
      \lyricsto "myPulses" {
        \set stanza = #"Ênfase:"
        Forte Fraco Forte Fraco
        Forte Fraco Fraco
        Forte Fraco
      }
    }

    \new Lyrics {
      \lyricsto "myPulses" {
        \set stanza = #"Símbolo:"

        \markup { "&mdash;" }
        \markup { "&bull;" }
        \markup { "&minus;" }
        \markup { "&bull;" }

        \markup { "&mdash;" }
        \markup { "&bull;" }
        \markup { "&bull;" }

        \markup { "&mdash;" }
        \markup { "&bull;" }
      }
    }
  >>

  \layout { }
  \midi { \tempo 4 = 90 }
}
