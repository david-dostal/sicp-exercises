#lang sicp
(#%require sicp-pict)

; Exercise 2.45:
; ==============
; Right-split and up-split can be expressed as instances of a general splitting
; operation. Define a procedure split with the property that evaluating

; (define right-split (split beside below))
; (define up-split (split below beside))

; produces procedures right-split and up-split with the same behaviors as the
; ones already defined.




(define (split split-large split-small)
  (define (draw painter n)
    (if (= n 0)
        painter
        (let ((smaller (draw painter (- n 1))))
          (split-large painter
                       (split-small smaller smaller)))))
  draw)


(define right-split (split beside below))
(define up-split (split below beside))

(paint (up-split diagonal-shading 2))
(paint (up-split einstein 5))

(paint (right-split diagonal-shading 2))
(paint (right-split einstein 5))