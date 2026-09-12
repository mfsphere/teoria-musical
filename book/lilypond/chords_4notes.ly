\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature
  \omit Score.BarNumber

  \key c \major
  \time 4/4
}

chordSequence = \relative c' {
  <c e g b>1		% Major seventh chord
  <c ees g b>		% Minor-major seventh chord
  <c e gis b>		% Augmented major seventh chord
  <c ees ges b>		% Diminished major seventh chord

  <c e g bes>		% Dominant seventh chord
  <c ees g bes>		% Minor seventh chord
  <c e gis bes>		% Augmented seventh chord
  <c ees ges bes>	% Half diminished seventh chord
}

sopranoVoice = \relative c {
  \global
  \chordSequence

  \bar "|."
}

verse = \lyricmode {
  \markup { \center-column { "Maior" "de sétima" } }
  \markup { \center-column { "Menor-maior" "de sétima" } }
  \markup { \center-column { "Maior aumentado" "de sétima" } }
  \markup { \center-column { "Maior diminuto" "de sétima" } }

  \markup { \center-column { "Dominante" "de sétima" } }
  \markup { \center-column { "Menor" "de sétima" } }
  \markup { \center-column { "Aumentado" "de sétima" } }
  \markup { \center-column { "Meio-diminuto" "de sétima" } }
}

chordNames = \chordmode {
  \global
  \chordSequence
}

sopranoVoicePart = \new Staff { \sopranoVoice }
\addlyrics { \verse }

chordsPart = \new ChordNames \chordNames

\score {
  <<
    \chordsPart
    \sopranoVoicePart
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
