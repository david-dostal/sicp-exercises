#lang sicp
(#%require "newtons-method.scm")

; Exercise 1.40:
; ==============
; Define a procedure cubic that can be used together with the newtons-method
; procedure in expressions of the form (newtons-method (cubic a b c) 1) to
; approximate zeros of the cubic x^3 + ax^2 + bx + c.


(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

(newtons-method (cubic 3 3 1) 1.0) ;-0.9999754400944522 (should be 1)
(newtons-method (cubic 2 -3 0) 1.0) ;1.0 (should be 1 or 0 or -3)
(newtons-method (cubic 2 -3 0) -5.0) ;-2.9999999999993805
(newtons-method (cubic 2 -3 0) -1) ;1.249992658048209e-011