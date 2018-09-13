#lang sicp
(#%provide average-damp)

; Average damping:
; ================


(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))