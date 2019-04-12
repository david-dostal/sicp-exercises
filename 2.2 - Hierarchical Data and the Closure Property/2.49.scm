#lang sicp
(#%require sicp-pict)

; Exercise 2.49:
; ==============
; Use segments->painter to define the following primitive painters:
; a. e painter that draws the outline of the designated frame.
; b. e painter that draws an "X" by connecting opposite corners of the frame.
; c. e painter that draws a diamond shape by connecting the midpoints of the
;    sides of the frame.
; d. e wave painter

(define outline
  (segments->painter
   (list (make-segment (make-vect 0.00 0.00) (make-vect 0.00 0.99))
         (make-segment (make-vect 0.00 0.99) (make-vect 0.99 0.99))
         (make-segment (make-vect 0.99 0.99) (make-vect 0.99 0.00))
         (make-segment (make-vect 0.99 0.00) (make-vect 0.00 0.00)))))

; I am using 0.99 here, because 1.0 is drawn slightly outside the frame, which
; causes the top end right edges to be invisible.

(define cross
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 1))
         (make-segment (make-vect 0 1) (make-vect 1 0)))))

(define diamond
  (segments->painter
   (list (make-segment (make-vect 0.5 0.0) (make-vect 1.0 0.5))
         (make-segment (make-vect 1.0 0.5) (make-vect 0.5 1.0))
         (make-segment (make-vect 0.5 1.0) (make-vect 0.0 0.5))
         (make-segment (make-vect 0.0 0.5) (make-vect 0.5 0.0)))))


(define wave
  (segments->painter
   (list (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
         (make-segment (make-vect 0.30 0.00) (make-vect 0.40 0.55))
         (make-segment (make-vect 0.40 0.55) (make-vect 0.15 0.40))
         (make-segment (make-vect 0.15 0.40) (make-vect 0.00 0.55))
         (make-segment (make-vect 0.00 0.65) (make-vect 0.20 0.55))
         (make-segment (make-vect 0.20 0.55) (make-vect 0.40 0.70))
         (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
         (make-segment (make-vect 0.35 0.85) (make-vect 0.45 1.00))

         (make-segment (make-vect 0.65 0.85) (make-vect 0.55 1.00))
         (make-segment (make-vect 0.60 0.70) (make-vect 0.65 0.85))
         (make-segment (make-vect 1.00 0.40) (make-vect 0.60 0.70))
         (make-segment (make-vect 0.60 0.55) (make-vect 1.00 0.30))
         (make-segment (make-vect 0.70 0.00) (make-vect 0.60 0.55))
         (make-segment (make-vect 0.60 0.00) (make-vect 0.50 0.30)))))
          
(paint outline)
(paint cross)
(paint diamond)
(paint wave)

; Some shapes could be simplified by using a 'line' procedure, which draws a
; line connecting a list of points. This would eliminate duplicate vectors for
; end of one segment and start of the next.
