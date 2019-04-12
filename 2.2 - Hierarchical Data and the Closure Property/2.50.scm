#lang sicp
(#%require sicp-pict)

; Exercise 2.50:
; ==============
; Define the transformation flip-horiz, which flips painters horizontally, and
; transformations that rotate painters counterclockwise by 180 degrees and
; 270 degrees.

(define flip-horiz
  (transform-painter
   (make-vect 1 0)
   (make-vect 0 0)
   (make-vect 1 1)))

(define rotate-180
  (transform-painter
   (make-vect 1 1)
   (make-vect 0 1)
   (make-vect 1 0)))

(define rotate-270
  (transform-painter
   (make-vect 0 1)
   (make-vect 0 0)
   (make-vect 1 1)))

(paint (flip-horiz einstein))
(paint (rotate-180 einstein))
(paint (rotate-270 einstein))
