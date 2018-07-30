#lang sicp

; Exercise 1.3:
; =============
; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.

(define (sum-larger x y z)
  (cond ((and (< x y) (< x z)) (+ y z))
        ((< y z) (+ x z))
        ((+ x y))))