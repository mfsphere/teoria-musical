\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.SystemStartBar
  \omit Score.TimeSignature

  \set melismaBusyProperties = #'()
  \slurDown
  \slurDashed

  \key es \major
  \time 32/4
}

sopranoVoiceI = \relative c' {
  \global
  ees?1 f g (aes?) bes? c d (ees?)

  \bar "|."
}

verseSopranoVoiceI = \lyricmode {
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

sopranoVoiceII = \relative c' {
  \global
  c1 d (ees?) f g (aes?) bes? c
}

verseSopranoVoiceII = \lyricmode {
  \set stanza =  "C menor:"
  \markup { C }
  \markup { D }
  \markup { E \smaller { \raise #0.3 \flat } }
  \markup { F }
  \markup { G }
  \markup { A \smaller { \raise #0.3 \flat } }
  \markup { B \smaller { \raise #0.3 \flat } }
  \markup { C }
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

%% Printed one above the other so the shared notes line up, but played in sequence:
%% sounded together they are a cluster, and the point is inaudible.
\score {
  {
    \sopranoVoiceI
    \sopranoVoiceII
  }
  \midi { \tempo 4 = 200 }
}
