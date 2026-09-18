\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \omit Score.TimeSignature

  \key f \major
  \time 28/4
}

chordSequence = \relative c'' {
  \chordmode { f1 g:m a:m bes c' d':m e':dim }
}

sopranoVoice = \relative c'' {
  \global
  \chordSequence

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Nome:"
  Tónica Supertónica Mediante Subdominante Dominante Submediante Sensível
}

verseTwo = \lyricmode {
  \set stanza = "AF:"
  I ii iii IV V vi \markup \rN { vii o }
}

chordNames = \chordmode {
  \global
  \chordSequence
}

sopranoVoicePart = \new Staff { \sopranoVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }

chordsPart = \new ChordNames \chordNames

\score {
  <<
    \chordsPart
    \sopranoVoicePart
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
