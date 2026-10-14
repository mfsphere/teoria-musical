\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

direita = \relative c'' {
  \clef treble

  % Cadência autêntica perfeita
  <g b>1^\markup { \translate #'(-2 . 1) "Cadências autênticas perfeitas:" }
  <g c>

  \bar "||"

  <f d'>
  <e c'>

  \bar "."

  % Cadência autêntica imperfeita
  <g d'>^\markup { \translate #'(-2 . 1) "Cadências autênticas imperfeitas:" }
  <g e'>

  \bar "||"

  <g f'>
  <g e'>

  \bar "|."
}

esquerda = {
  \clef bass

  % Cadência autêntica perfeita
  <g d'>1
  <c e'>

  <g b>
  <c g>

  % Cadência autêntica imperfeita
  <g b>
  <c c'>

  <g b>
  <c c'>
}

cadencia = \lyricmode {
  \set stanza = #"C Maior:"
  \markup \rN { V }
  \markup \rN { I }

  \markup \rN { V 7}
  \markup \rN { I }

  \markup \rN { V }
  \markup \rN { I }

  \markup \rN { V 7}
  \markup \rN { I }
}

\score {
  <<
    \new GrandStaff <<
      \new Voice = "direita" \direita
      \new Voice = "esquerda" \esquerda
    >>
    \new Lyrics \lyricsto esquerda \cadencia
  >>
  \layout { }
  \midi { \tempo 4 = 80 }
}
