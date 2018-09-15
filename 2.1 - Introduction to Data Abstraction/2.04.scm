#lang sicp

; Exercise 2.04:
; ==============
; Here is an alternative procedural representation of pairs. For this
; representation, verify that (car (cons x y)) yields x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; What is the corresponding definition of cdr? (Hint: To verify that this works,
; make use of the substitution model of Section 1.1.5.)



; Verify that (car (cons x y)) always yields x:

(define x 1)
(define y 2)

(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

; cdr procedure:
(define (cdr z)
  (z (lambda (p q) q)))


; cons returns a lambda, which, given a procedure, calls it with x and y as
; arguments.
; 
; car applies to that procedure, which always choses the first of those
; arguments, cdr always returns only the second of the arguments.