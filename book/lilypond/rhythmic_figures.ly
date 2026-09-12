\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.Clef
  \omit Score.BarLine
  \omit Score.SystemStartBar
  \omit Score.TimeSignature

  \key c \major
  \time 4/4
}

notasVoice = \relative c'' {
  \global
  c1 c2 c4 c8 c16 c32
}

verseOne = \lyricmode {
  \set stanza = "PT:"
  Semibreve Mínima Semínima Colcheia Semicolcheia Fusa
}

verseTwo = \lyricmode {
  \set stanza = "UK:"
  Semibreve Minim Crotchet Quaver Semiquaver Demisemiquaver
}

verseThree = \lyricmode {
  \set stanza = "US:"
  "Whole note" "Half note" "Quarter note" "Eighth note" "Sixteenth note" "Thirty-second note"
}

verseFour = \lyricmode {
  \set stanza = "Valor:"
  "1"
  \markup { \concat { 1 \char ##x2f 2 } }
  \markup { \concat { 1 \char ##x2f 4 } }
  \markup { \concat { 1 \char ##x2f 8 } }
  \markup { \concat { 1 \char ##x2f 16 } }
  \markup { \concat { 1 \char ##x2f 32 } }
}

pausasVoice = \relative c'' {
  \global
  r1 r2 r4 r8 r16 r32
}

notasVoicePart = \new Staff \with {
  instrumentName = "Notas"
} { \notasVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour }

pausasVoicePart = \new Staff \with {
  instrumentName = "Pausas"
} \pausasVoice

\score {
  <<
    \notasVoicePart
    \pausasVoicePart
  >>
  \layout { }
}
