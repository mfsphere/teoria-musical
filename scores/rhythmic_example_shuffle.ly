\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

shuffle=  {
  \global

  \repeat unfold 4 { \tuplet 3/2 { c8[ r8  c8] } }

  \bar ":|."
}

pulsos = \lyricmode {
  \set stanza = #"Pulsos:"

  "1" \skip 1
  "2" \skip 1
  "3" \skip 1
  "4" \skip 1
}

\score {
  \new RhythmicStaff \with { midiInstrument = "woodblock" } { \shuffle }
  \addlyrics { \pulsos }
  \layout { }
  \midi { \tempo 4 = 100 }
}
