#lang sicp
(#%require "book-code.scm")

; Exercise 1.6:
; =============
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
; “Why can’t I just define it as an ordinary procedure in terms of cond?” she
; asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she
; defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; What happens when Alyssa attempts to use this to compute square roots?
; Explain.


; When Alyssa attempts to use new-if to compute square-roots, the program goes
; into an infinite loop. This is because scheme uses applicative order
; evaluation of arguments.
;
; That means if new-if is called it first evaluates all its arguments before
; returning a value. The evaluation of arguments includes a recursive call to
; sqrt-iter. sqrt-iter in turn calls new-if again and the cycle continues...