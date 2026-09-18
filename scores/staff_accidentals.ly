\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \key c \major
  \time 20/4
}

acidentes = \relative c' {
  \global
  fis1 fes fisis feses f!

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "Nome:"
  "Sustenido"
  "Bemol"
  "Duplo sustenido"
  "Duplo bemol"
  "Bequadro"
}

verseTwo = \lyricmode {
  \set stanza = "Efeito:"
  \markup { \char #0043 \char #0189 tom }
  \markup { \char #0045 \char #0189 tom }
  \markup { \char #0043 1 tom }
  \markup { \char #0045 1 tom }
  Cancela
}

\score {
  \new Staff { \acidentes }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
}
