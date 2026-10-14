\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

global = {
  \key c \major
  \time 4/4
}

names = \chordmode {
  \global
  c1
  a:7 d:m
  b:7 e:m
  c:7 f
  d:7 g
  e:7 a:m
  c
}

%% Four voices, led rather than stacked: the sensível rises, the seventh falls, the
%% shared voice is held. Each dominant drops its fifth so the resolution is complete.
right = {
  \global
  <e' g' c''>1
  <g' a' cis''> <f' a' d''>
  <a' b' dis''> <g' b' e''>
  <bes' c'' e''> <a' c'' f''>
  <c'' d'' fis''> <b' d'' g''>
  <d'' e'' gis''> <c'' e'' a''>
  <c'' e'' g''>

  \bar "|."
}

left = {
  \global
  c1
  a, d
  b, e
  c f
  d g
  e a
  c

  \bar "|."
}

analysis = \lyricmode {
  \markup \rN { I }
  \markup \rN { V / ii } \markup \rN { ii }
  \markup \rN { V / iii } \markup \rN { iii }
  \markup \rN { V / IV } \markup \rN { IV }
  \markup \rN { V / V } \markup \rN { V }
  \markup \rN { V / vi } \markup \rN { vi }
  \markup \rN { I }
}

\score {
  <<
    \new ChordNames \names
    \new PianoStaff <<
      \new Staff { \clef treble \right }
      \new Staff { \clef bass \new Voice = "bass" \left }
    >>
    \new Lyrics \lyricsto "bass" \analysis
  >>
  \layout { }
  \midi { \tempo 4 = 100 }
}
