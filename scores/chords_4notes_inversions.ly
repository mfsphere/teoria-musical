\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

chordSequence = \relative c {
  \chordmode { c1:7 c'1:7/e c'1:7/g c'1:7/bes }
}

chordNames = \chordmode {
  \global
  \chordSequence
}

sopranoVoice = \relative c {
  \global
  \chordSequence

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Acorde:"
  \markup { \center-column { "Estado" "fundamental" } }
  \markup { \center-column { "Primeira" "inversão" } }
  \markup { \center-column { "Segunda" "inversão" } }
  \markup { \center-column { "Terceira" "inversão" } }
}

verseTwo = \lyricmode {
  \set stanza = "AF:"
  \markup \rN { I 7 }
  \markup \rN { I 6 5 }
  \markup \rN { I 4 3 }
  \markup \rN { I 4 2 }
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
