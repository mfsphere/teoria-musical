\version "2.26.0"

\header {
  tagline = ##f
}

%% Margins set the line width (A4 less 2 in = 159.2 mm), which decides where
%% systems break; -dcrop then trims the whitespace for the web.
\paper {
  top-margin = 1\in
  bottom-margin = 1\in
  left-margin = 1\in
  right-margin = 1\in

  %% Name the text font rather than falling back to the system serif: the site
  %% self-hosts it, so engraving no longer varies by machine.
  property-defaults.fonts.serif = "TeX Gyre Schola"
  property-defaults.fonts.sans = "TeX Gyre Heros"
}

\layout {
  indent = 0\in
  ragged-last = ##f

  \override Score.InstrumentName.font-size = #-1

  %% Lyrics are used as labels, and long ones touch without a minimum gap; with it,
  %% the notes are pushed apart until the labels fit.
  \context {
    \Lyrics
    \override LyricSpace.minimum-distance = #1.2
  }
}

%% Records where each note is printed and when it is played, both keyed by origin, so
%% a bar played twice matches the one bar printed. The X is LilyPond's own.
#(define (origin-of event)
   (let ((where (and (ly:stream-event? event) (ly:event-property event 'origin))))
     (and (ly:input-location? where) (ly:input-file-line-char-column where))))

#(define cursor-port
   (open-output-file (string-append (ly:parser-output-name) ".positions")))

#(define (record-position grob)
   (let ((origin (origin-of (ly:grob-property grob 'cause)))
         (x (ly:grob-relative-coordinate grob (ly:grob-system grob) X)))
     (if origin
         (format cursor-port "~a ~a ~a\n" (second origin) (third origin) x))))

#(define schedule-port
   (open-output-file (string-append (ly:parser-output-name) ".schedule")))

#(define (record-schedule context)
   (make-performer
     (listeners
       ((note-event performer event)
        (let ((origin (origin-of event)))
          (if origin
              (format schedule-port "~a ~a ~a\n"
                      (exact->inexact (ly:moment-main (ly:context-current-moment context)))
                      (second origin) (third origin))))))))

\layout {
  \override NoteHead.after-line-breaking = #record-position
}

%% ChordNames exists to print chord symbols; without this it also sounds them,
%% doubling the staff it labels.
\midi {
  \context {
    \ChordNames
    \remove "Note_performer"
  }
  \context {
    \Voice
    \consists #record-schedule
  }
}
