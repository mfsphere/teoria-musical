\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.SystemStartBar
  \omit Score.TimeSignature
  \omit Score.NoteHead

  \key c \major
  \time 4/4
}

bemoisOrdem = {
  \set Staff.keyAlterations = #`((13 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)(12 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)(12 . ,FLAT)(15 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)(12 . ,FLAT)(15 . ,FLAT)(11 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)(12 . ,FLAT)(15 . ,FLAT)(11 . ,FLAT)(14 . ,FLAT)) d1 \bar "||"
  \set Staff.keyAlterations = #`((13 . ,FLAT)(16 . ,FLAT)(12 . ,FLAT)(15 . ,FLAT)(11 . ,FLAT)(14 . ,FLAT)(10 . ,FLAT)) d1 \bar "|."
}

bemoisTreble = \relative c {
  \global
  \bemoisOrdem
}

bemoisBass = \relative c {
  \global
  \bemoisOrdem
}

verseOne = \lyricmode {
  "F Maior"
  \markup { B \smaller { \raise #0.3 \flat } Maior }
  \markup { E \smaller { \raise #0.3 \flat } Maior }
  \markup { A \smaller { \raise #0.3 \flat } Maior }
  \markup { D \smaller { \raise #0.3 \flat } Maior }
  \markup { G \smaller { \raise #0.3 \flat } Maior }
  \markup { C \smaller { \raise #0.3 \flat } Maior }
}

verseTwo = \lyricmode {
  "D menor"
  "G menor"
  "C menor"
  "F menor"
  \markup { B \smaller { \raise #0.3 \flat } menor }
  \markup { E \smaller { \raise #0.3 \flat } menor }
  \markup { A \smaller { \raise #0.3 \flat } menor }
}

violinPart = \new Staff \bemoisTreble

bassVoicePart = \new Staff { \clef bass \bemoisBass }
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
