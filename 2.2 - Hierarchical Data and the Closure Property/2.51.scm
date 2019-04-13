#lang sicp
(#%require sicp-pict)

; Exercise 2.51:
; ==============
; Define the below operation for painters. Below takes two painters as
; arguments. The resulting painter, given a frame, draws with the first painter
; in the bottom of the frame and with the second painter in the top.
; Define below in two different ways - first by writing a procedure that is
; analogous to the beside procedure given above, and again in terms of beside
; and suitable rotation operations (from Exercise 2.50).

(define (combine p1 p2)
  (lambda (frame)
    (p1 frame)
    (p2 frame)))

(define (below-1 p1 p2)
  (combine
   ((transform-painter
     (make-vect 0.0 0.0)
     (make-vect 1.0 0.0)
     (make-vect 0.0 0.5))
    p1)
   ((transform-painter
     (make-vect 0.0 0.5)
     (make-vect 1.0 0.5)
     (make-vect 0.0 1.0))
    p2)))

(define (below-2 p1 p2)
  (rotate90 (beside (rotate270 p1) (rotate270 p2))))


(paint (below-1 diagonal-shading einstein))
(paint (below-2 diagonal-shading einstein))
