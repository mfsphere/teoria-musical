\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key g \major
  \time 4/4
}

soprano = \relative c'' {
  \global
  c1 d c b g

  \bar "|."
}

alto = \relative c'' {
  \global
  a g fis g e

  \bar "|."
}

tenor = \relative c' {
  \global
  e d d d c

  \bar "|."
}

bass = \relative c {
  \global
  c b d g, c

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "G:"
  \markup \rN { ii 6 }
  \markup \rN { I 6 }
  \markup \rN { V }
  \markup \rN { I }
}

verseTwo = \lyricmode {
  \set stanza = "C:"
  \repeat unfold 3 { \skip 1 }
  \markup \rN { V }
  \markup \rN { I }
}

\score {
  \new PianoStaff <<
    \new Staff
    <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>

    \new Staff
    <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
      \addlyrics { \verseOne }
      \addlyrics { \verseTwo }
    >>
  >>
  \layout { }
  \midi { \tempo 4 = 80 }
}
