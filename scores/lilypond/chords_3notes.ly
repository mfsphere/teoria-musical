\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

chordSequence = \relative c {
  \chordmode { c1 c:m c:aug c:dim }
}

chordNames = \chordmode {
  \global
  \chordSequence
}

sopranoVoice = \relative c'' {
  \global
  \chordSequence

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Triade:"
  Maior Menor Aumentada Diminuta
}

verseTwo = \lyricmode {
  \set stanza = "Análise funcional:"
  \markup \rN { I }
  \markup \rN { I m }
  \markup \rN { I + }
  \markup \rN { I o }
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
