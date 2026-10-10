\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.SystemStartBar
  \omit Score.TimeSignature

  \set melismaBusyProperties = #'()
  \slurDown
  \slurDashed

  \time 4/4
}

sopranoVoiceI = \relative c' {
  \global

  \key d \major

  d1 e fis? (g) a b cis? (d)

  \bar "|."
}

verseSopranoVoiceI = \lyricmode {
  \set stanza =  "D Maior:"
  \markup { D }
  \markup { E }
  \markup { F \teeny { \raise #0.5 \sharp } }
  \markup { G }
  \markup { A }
  \markup { B }
  \markup { C \teeny { \raise #0.5 \sharp } }
  \markup { D }
}

sopranoVoiceII = \relative c' {
  \global

  \key f \major
  d e (f) g a (bes?) c d

  \bar "|."
}

verseSopranoVoiceII = \lyricmode {
  \set stanza =  "D menor:"
  \markup { D }
  \markup { E }
  \markup { F }
  \markup { G }
  \markup { A }
  \markup { B \smaller { \raise #0.3 \flat } }
  \markup { C }
  \markup { D }
}

sopranoVoiceIPart = { \sopranoVoiceI }
\addlyrics { \verseSopranoVoiceI }

sopranoVoiceIIPart = { \sopranoVoiceII }
\addlyrics { \verseSopranoVoiceII }

\score {
  <<
    \sopranoVoiceIPart
    \sopranoVoiceIIPart
  >>
  \layout { }
}

%% Printed one above the other so the altered degrees line up, but played in
%% sequence: the same tonic taking a different colour only shows in time.
\score {
  {
    \sopranoVoiceI
    \sopranoVoiceII
  }
  \midi { \tempo 4 = 200 }
}
