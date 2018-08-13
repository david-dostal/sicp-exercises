#lang sicp
(#%provide (all-defined))

; Smallest Divisor
; ================

(define (smallest-divisor n)
  (define (iter n divisor)
    (cond ((> (* divisor divisor) n) n)
          ((divides? divisor n) divisor)
          (else (iter n (+ 1 divisor)))))
  (iter n 2))

(define (divides? a b)
  (= 0 (remainder b a)))