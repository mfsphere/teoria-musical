\version "2.26.0"

\include "roman_numeral_analysis_tool.ily"
\include "global.ily"

direita = \relative c'' {
  \clef treble

  % Cadência Plagal
  <a c>1^\markup { \translate #'(-2 . 1) "Cadência plagal:" }
  <g c>

  \bar "||"

  <e c'>^\markup { \translate #'(-2 . 1) "Meia-cadência:" }
  <d b'>

  \bar "||"

  <b' d>^\markup { \translate #'(-2 . 1) "Cadência evitada:" }
  <a c>

  \bar "|."
}

esquerda = {
  \clef bass

  % Cadência Plagal
  <f f'>1
  <c e'>

  % Meia Cadência
  <c g>
  <g, g>

  % Cadência envitada ou interrompida
  <g, g>
  <a e'>
}

cadencia = \lyricmode {
  \set stanza = #"C Maior:"
  \markup \rN { IV }
  \markup \rN { I }

  \markup \rN { I }
  \markup \rN { V }

  \markup \rN { V }
  \markup \rN { vi }

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
