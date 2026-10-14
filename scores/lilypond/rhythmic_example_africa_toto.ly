\version "2.26.0"

\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

drumOne = \drummode {
  \global

  \repeat volta 2 {
    cymr16^"1"
    cymr16
    cymr16^"e"
    cymr16

    cymr16^"2"
    cymr16
    cymr16^"e"
    cymr16

    cymr16^"3"
    cymr16
    cymr16^"e"
    cymr16

    cymr16^"4"
    cymr16
    cymr16^"e"
    cymr16
  }
}

drumTwo = \drummode {
  \global

  %% Repeated with the cymbal voice above, so the two stay together when the
  %% repeat is unfolded for playback.
  \repeat volta 2 {
    bassdrum8. bassdrum16 snare4 bassdrum8. bassdrum16 <bassdrum snare>4
  }
}

\score {
  \new DrumStaff
  <<
    \new DrumVoice { \voiceOne \drumOne }
    \new DrumVoice { \voiceTwo \drumTwo }
  >>
  \layout { }
}

%% A separate score for playback: the printed figure keeps its repeat signs,
%% and the recording plays what a musician reading them would play.
\score {
  \unfoldRepeats {
    \new DrumStaff
    <<
      \new DrumVoice { \voiceOne \drumOne }
      \new DrumVoice { \voiceTwo \drumTwo }
    >>
  }
  \midi { \tempo 4 = 92 }
}
