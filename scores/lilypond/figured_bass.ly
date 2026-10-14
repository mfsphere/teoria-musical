\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

sopranoVoice = \relative c' {
  \global
  <c e g>1
  <e g c>1
  <g c e>1

  \bar "||"

  <c, e g b>1
  <e g b c>1
  <g b c e>1
  <b c e g>1

  \bar "|."
}

verse = \lyricmode {
  "Tríades:"
  \repeat unfold 2 { \skip 1 }

  "Acordes de sétima:"
}

figBass = \figuremode {
  \global
  <5 3>1
  <6 3>1
  <6 4>1

  <7>1
  <6 5>1
  <4 3>1
  <4 2>1
}

sopranoVoicePart = \new Staff { \sopranoVoice }

bassFiguresPart = \new FiguredBass \figBass

\score {
  <<
    \new Lyrics {
      \verse
    }
    \sopranoVoicePart
    \bassFiguresPart
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
