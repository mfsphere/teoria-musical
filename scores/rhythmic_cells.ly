\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 1/4
}

celulasRitmicas = {
  \global
  \repeat unfold 2 { c8 }
  \repeat unfold 4 { c16 }
  c8 \repeat unfold 2 { c16 }
  \repeat unfold 2 { c16 } c8
  c16 c8 c16
  c8. c16
  c16 c8.
  \tuplet 3/2 { c8 c8 c8 }
}

celulasExemplos = \lyricmode {
  \set stanza = #"Exemplo n.º:"

  "1" \skip 1
  "2" \repeat unfold 3 { \skip 1 }
  "3" \repeat unfold 2 { \skip 1 }
  "4" \repeat unfold 2 { \skip 1 }
  "5" \repeat unfold 2 { \skip 1 }
  "6" \skip 1
  "7" \skip 1
  "8" \repeat unfold 2 { \skip 1 }
}

\score {
  \new RhythmicStaff \with { midiInstrument = "woodblock" } { \celulasRitmicas }
  \addlyrics { \celulasExemplos }
  \layout { }
  \midi { \tempo 4 = 80 }
}
