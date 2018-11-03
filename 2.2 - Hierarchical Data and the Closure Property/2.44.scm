#lang sicp
(#%require sicp-pict)


; Exercise 2.44:
; ==============
; Define the procedure up-split used by corner-split. It is similar to
; right-split, except that it switches the roles of below and beside.




(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(paint (up-split diagonal-shading 2))
(paint (up-split einstein 5))

; Note: I am using the builtin painters diagonal-shading and einstein instead of
; wave and rogers, because they are provided by the sicp language in DrRacket.
