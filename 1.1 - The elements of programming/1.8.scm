#lang sicp
(#%require "book-code.scm")

(define (good-enough-2? guess lastguess x)
  (< (abs (- guess lastguess))
     0.000001))

; Exercise 1.8:
; =============
; Newton’s method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a beer approximation is given by
; the value ((x / y^2) + 2y) / 3.
; Use this formula to implement a cube-root procedure analogous to the
; square-root procedure. (In Section 1.3.4 we will see how to implement Newton’s
; method in general as an abstraction of these square-root and cube-root
; procedures.)

(define (cubert x) (cubert-iter 1 x))

(define (cubert-iter guess x)
  (if (good-enough-2? guess (improve guess x) x)
      guess
      (cubert-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2.0 guess))
     3.0))

(cubert 8)
; 2.000000000012062

(cubert 27)
; 3.0000005410641766

(cubert 1000000)
; 100.00000000005313

(cubert 0.008)
; 0.20000009719812561