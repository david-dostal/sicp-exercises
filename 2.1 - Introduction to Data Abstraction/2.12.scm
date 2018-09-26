#lang sicp
(#%require "2.07.scm")
(#%require "2.08.scm")
(#%provide (all-defined))

; Exercise 2.12:
; ==============
; Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector
; percent that produces the percentage tolerance for a given interval.
; The center selector is the same as the one shown above.

; The code shown above:
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))



; Solution to the exercise:
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (percent i)
  (* 100.0 (/ (width i) (center i))))