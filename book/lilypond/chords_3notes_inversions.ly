\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

chordSequence = \relative c' {
  <c e g>1
  <e g c>
  <g c e>
}

chordNames = \chordmode {
  \global
  c1 c:/e c:/g
}

sopranoVoice = \relative c'' {
  \global
  \chordSequence

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Triade:"
  "Estado fundamental"
  "Primeira inversão"
  "Segunda inversão"
}

verseTwo = \lyricmode {
  \set stanza = "Análise funcional:"
  \markup \rN { I }
  \markup \rN { I 5 3 }
  \markup \rN { I 6 3 }
  \markup \rN { I 6 4 }
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff { \sopranoVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }

\score {
  <<
    \chordsPart
    \sopranoVoicePart
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
