\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 3/4
}

violin = \relative c'' {
  \global

  c4 c c
  \repeat volta 2 { g4 g g }
  \alternative {
    {
      e4 e e
      d4 d d
    }
    { c4 c c }
  }
  \bar "|."
}

\score {
  \new Staff { \violin }
  \layout { }
}

%% A separate score for playback: the printed figure keeps its repeat and its
%% two endings, and the recording plays the route through them.
\score {
  \unfoldRepeats { \new Staff { \violin } }
  \midi { \tempo 4 = 100 }
}
