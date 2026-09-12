\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature
  \omit Score.BarNumber
  \omit Score.BarLine

  \override Staff.Clef.full-size-change = ##t

  \key c \major
  \time 4/4
}

claves = \relative c {
  \global
  \once \omit Score.Clef
  \once \omit Score.NoteHead

  c1 \clef percussion

  \once \omit Score.NoteHead
  c \clef subbass

  f \clef bass
  f \clef baritone
  c' \clef tenor
  c \clef alto

  \break

  c \clef mezzosoprano
  c \clef soprano
  c \clef treble
  g' \clef french

  g
}

verse = \lyricmode {
  \override LyricText.X-offset = #-8

  \set stanza = "Claves:"

  \skip 1
  "1. Percussão"
  "2. Sub-baixo (F4)"
  "3. Baixo (F4)"
  "4. Barítono (C4)"
  "5. Tenor (C4)"
  "6. Alto (C4)"
  "7. Meio-soprano (C4)"
  "8. Soprano (C4)"
  "9. Sol (G4)"
  "10. Francesa (G4)"
}

\score {
  \new Staff { \claves }
  \addlyrics { \verse }
  \layout {
    \set Staff.explicitClefVisibility = #end-of-line-invisible
  }
}
