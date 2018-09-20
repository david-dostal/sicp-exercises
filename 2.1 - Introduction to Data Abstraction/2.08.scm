#lang sicp
(#%require "2.07.scm")

; Exercise 2.08:
; ==============
; Using reasoning analogous to Alyssa’s, describe how the difference of two
; intervals may be computed. Define a corresponding subtraction procedure,
; called sub-interval.


; Given two intervals x and y, the smallest possible value in x - y is the lower
; bound of x minus the upper bound of y. The largest possible value is the upper
; bound of x minus the lower bound of y.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))