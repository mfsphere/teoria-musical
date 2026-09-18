\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \set melismaBusyProperties = #'()
  \slurDown
  \slurDashed

  \key c \major
  \time 32/4
}

escala = \relative c' {
  \global
  c1 d e (f) g a b (c)

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Anglo-saxónico:"
  C D E F G A B C
}

verseTwo = \lyricmode {
  \set stanza = "Português:"
  Dó Ré Mi Fá Sol Lá Si Dó
}

\score {
  \new Staff { \escala }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
  \midi { \tempo 4 = 200 }
}
