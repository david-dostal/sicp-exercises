#lang sicp
(#%require "vectors.scm")

; Exercise 2.48:
; ==============
; A directed line segment in the plane can be represented as a pair of vectors
; — the vector running from the origin to the start-point of the segment, and
; the vector running from the origin to the end-point of the segment.
;
; Use your vector representation from Exercise 2.46 to define a representation
; for segments with a constructor make-segment and selectors start-segment and
; end-segment.


(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

(define segment (make-segment (make-vect 2 3) (make-vect 4 5)))
(display segment) ; ((2 3) (4 5))
(newline)
(display (start-segment segment)) ; (2 3)
(newline)
(display (end-segment segment)) ; (4 5)
(newline)