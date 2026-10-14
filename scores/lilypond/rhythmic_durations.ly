\version "2.26.0"

\include "global.ily"

global = {
  \omit Score.Clef
  \omit Score.SystemStartBar
  \omit Score.TimeSignature

  \key c \major
  \time 4/4
}

scoreASopranoVoiceI = \relative c'' {
  \global
  c1
}

scoreAVerseSopranoVoiceI = \lyricmode {
  "1"
}

scoreASopranoVoiceII = \relative c'' {
  \global
  \repeat unfold 2 { c2 }
}

scoreAVerseSopranoVoiceII = \lyricmode {
  "1" "3"
}

scoreASopranoVoiceIII = \relative c'' {
  \global
  \repeat unfold 4 { c4 }
}

scoreAVerseSopranoVoiceIII = \lyricmode {
  "1" "2" "3" "4"
}

scoreASopranoVoiceIV = \relative c'' {
  \global
  \repeat unfold 8 { c8 }
}

scoreAVerseSopranoVoiceIV = \lyricmode {
  "1" "e" "2" "e" "3" "e" "4" "e"
}

scoreASopranoVoiceV = \relative c'' {
  \global
  \repeat unfold 16 { c16 }
}

scoreAVerseSopranoVoiceV = \lyricmode {
  "1" "e" "&" "a"
  "2" "e" "&" "a"
  "3" "e" "&" "a"
  "4" "e" "&" "a"
}

scoreASopranoVoiceVI = \relative c'' {
  \global
  \repeat unfold 32 { c32 }
}

scoreASopranoVoiceIPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Semibreve"
} { \scoreASopranoVoiceI }
\addlyrics { \scoreAVerseSopranoVoiceI }

scoreASopranoVoiceIIPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Mínima"
} { \scoreASopranoVoiceII }
\addlyrics { \scoreAVerseSopranoVoiceII }

scoreASopranoVoiceIIIPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Semínima"
} { \scoreASopranoVoiceIII }
\addlyrics { \scoreAVerseSopranoVoiceIII }

scoreASopranoVoiceIVPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Colcheia"
} { \scoreASopranoVoiceIV }
\addlyrics { \scoreAVerseSopranoVoiceIV }

scoreASopranoVoiceVPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Semicolcheia"
} { \scoreASopranoVoiceV }
\addlyrics { \scoreAVerseSopranoVoiceV }

scoreASopranoVoiceVIPart = \new RhythmicStaff \with {
  midiInstrument = "woodblock"
  instrumentName = "Fusa"
} { \scoreASopranoVoiceVI }

\score {
  <<
    \scoreASopranoVoiceIPart
    \scoreASopranoVoiceIIPart
    \scoreASopranoVoiceIIIPart
    \scoreASopranoVoiceIVPart
    \scoreASopranoVoiceVPart
    \scoreASopranoVoiceVIPart
  >>
  \layout { }
  \midi { \tempo 4 = 60 }
}
