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
          Compasso simples:
        }
      }
    } {
      \new Voice = "myRhythm" {
        \set Staff.midiInstrument = "woodblock"
        \numericTimeSignature

        \time 4/4
        c2 c4 c8 c8

        \time 3/4
        c4 c8 c8 c16 c16 c16 c16

        \time 2/4
        c4. c8
      }

      \bar "||"
    }

    \new RhythmicStaff \with {  instrumentName = #"Pulsos:" } {
      \new Voice = "myPulses" {
        %% A RhythmicStaff draws one line whatever the pitch, so the three
        %% layers are separated by octave to be told apart by ear.
        \set Staff.midiInstrument = "woodblock"
        \numericTimeSignature

        \time 4/4
        \repeat unfold 4 { c,,4 }

        \time 3/4
        \repeat unfold 3 { c,,4 }

        \time 2/4
        \repeat unfold 2 { c,,4 }
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

        \time 4/4
        \set Timing.beamExceptions = #'()
        \set Timing.beatStructure = 1,1,1,1
        \repeat unfold 8 { c''8 }

        \time 3/4
        \set Timing.beamExceptions = #'()
        \set Timing.beatStructure = 1,1,1
        \repeat unfold 6 { c''8 }

        \time 2/4
        \set Timing.beamExceptions = #'()
        \set Timing.beatStructure = 1,1
        \repeat unfold 4 { c''8 }
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
