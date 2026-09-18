\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

chordSequence = \relative c' {
  <c e g>1
  <c g' e' c'>

  \bar "||"

  <ees g bes des>1
  <ees bes' g' des'>1
}

chordNames = \chordmode {
  \global
  c1 c1 ees1:7 ees1:7
}

sopranoVoice = \relative c {
  \global
  \chordSequence

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Posição:"
  \repeat unfold 2 { Fechada Aberta }
}

verseTwo = \lyricmode {
  \set stanza = "Exemplo n.º:"
  "1" "2" "3" "4"
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
