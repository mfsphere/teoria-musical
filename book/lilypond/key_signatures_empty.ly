\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature
  \omit Score.NoteHead

  \key c \major
  \time 4/4
}

empty = \relative c'' {
  \global

  d1 \bar "|."
}

verseOne = \lyricmode {
  "C Maior"
}

verseTwo = \lyricmode {
  "A menor"
}

\score {
  \new Staff { \empty }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout {
    \override Score.LyricText.font-size = #-1
    ragged-last = ##t
  }
}
