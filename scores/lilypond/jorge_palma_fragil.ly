\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.BarNumber

  \key g \minor
  \time 4/4
  \tempo 4=208
}

sopranoVoice = \relative c'' {
  \global

  \tuplet 3/2 4 { g8~ \startGroup g f g~ g bes~ } bes2
  \tuplet 3/2 4 { g8~ g f d~ d c~ } c2
  c4 \tuplet 3/2 4 { c8~ c bes c~ c d } c4~
  c1\stopGroup

  \tuplet 3/2 4 { g'8~ \startGroup g f g~ g bes~ } bes2
  \tuplet 3/2 4 { g8~ g f d~ d c~ } c2
  c4 \tuplet 3/2 4 { c8~ c bes d~ d bes } g4~
  g1\stopGroup

  \bar "|."
}

verse = \lyricmode {
  "Frase 1"
  \repeat unfold 13 { \skip 1 }
  "Frase 2"
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verse }
  \layout {
    \context {
      \Voice
      \consists "Horizontal_bracket_engraver"
    }
  }
  \midi { }
}
