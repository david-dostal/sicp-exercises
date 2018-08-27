#lang sicp
(#%require "fast-prime.scm")
(#%provide (all-defined))

; Find n primes above x (fast)
; ============================

(define (find-primes above count)
  (cond ((> count 0)
         (display (next-prime above))
         (newline)
         (find-primes (+ (next-prime above) 1) (- count 1)))))

(define (next-prime n)
  (if (fast-prime? n 5)
      n
      (next-prime (+ n 1))))