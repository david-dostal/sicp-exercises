#lang sicp
(#%provide (all-defined))

; Sum procedure:
; ==============

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
