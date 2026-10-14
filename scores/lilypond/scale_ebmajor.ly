\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.TimeSignature

  \set melismaBusyProperties = #'()
  \slurDown
  \slurDashed

  \key es \major
  \time 32/4
}

escala = \relative c' {
  \global
  es?1 f g (aes?) bes? c d (es?)

  \bar "|."
}

verse = \lyricmode {
  \set stanza =  \markup { E \smaller { \raise #0.3 \flat } Maior: }
  \markup { E \smaller { \raise #0.3 \flat } }
  \markup { F }
  \markup { G }
  \markup { A \smaller { \raise #0.3 \flat } }
  \markup { B \smaller { \raise #0.3 \flat } }
  \markup { C }
  \markup { D }
  \markup { E \smaller { \raise #0.3 \flat } }
}

\score {
  \new Staff { \escala }
  \addlyrics { \verse }
  \layout { }
  \midi { \tempo 4 = 200 }
}

