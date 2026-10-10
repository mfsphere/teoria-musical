\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
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
  \set stanza = "Nota:"
  C D E F G A B C
}

verseTwo = \lyricmode {
  \set stanza = "Grau:"
  \markup \scaleDegree { 1 }
  \markup \scaleDegree { 2 }
  \markup \scaleDegree { 3 }
  \markup \scaleDegree { 4 }
  \markup \scaleDegree { 5 }
  \markup \scaleDegree { 6 }
  \markup \scaleDegree { 7 }
  \markup \scaleDegree { 1 }
}

\score {
  \new Staff { \escala }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
  \midi { \tempo 4 = 200 }
}
