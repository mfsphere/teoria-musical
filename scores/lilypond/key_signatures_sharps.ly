\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.SystemStartBar
  \omit Score.TimeSignature
  \omit Score.NoteHead

  \key c \major
  \time 4/4
}

sustenidosOrdem = {
  \set Staff.keyAlterations = #`((10 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)(11 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)(11 . ,SHARP)(8 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)(11 . ,SHARP)(8 . ,SHARP)(12 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)(11 . ,SHARP)(8 . ,SHARP)(12 . ,SHARP)(9 . ,SHARP)) d1 \bar "||"
  \set Staff.keyAlterations = #`((10 . ,SHARP)(7 . ,SHARP)(11 . ,SHARP)(8 . ,SHARP)(12 . ,SHARP)(9 . ,SHARP)(13 . ,SHARP)) d1 \bar "|."
}

sustenidosTreble = \relative c {
  \global
  \sustenidosOrdem
}

sustenidosBass = \relative c {
  \global
  \sustenidosOrdem
}

verseOne = \lyricmode {
  "G Maior"
  "D Maior"
  "A Maior"
  "E Maior"
  "B Maior"
  \markup { F \teeny { \raise #0.5 \sharp } Maior }
  \markup { C \teeny { \raise #0.5 \sharp } Maior }
}

verseTwo = \lyricmode {
  "E menor"
  "B menor"
  \markup { F \teeny { \raise #0.5 \sharp } menor }
  \markup { C \teeny { \raise #0.5 \sharp } menor }
  \markup { G \teeny { \raise #0.5 \sharp } menor }
  \markup { D \teeny { \raise #0.5 \sharp } menor }
  \markup { A \teeny { \raise #0.5 \sharp } menor }
}

violinPart = \new Staff \sustenidosTreble

bassVoicePart = \new Staff { \clef bass \sustenidosBass  }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }

\score {
  <<
    \violinPart
    \bassVoicePart
  >>
  \layout {
    \override Score.LyricText.font-size = #-1
  }
}
