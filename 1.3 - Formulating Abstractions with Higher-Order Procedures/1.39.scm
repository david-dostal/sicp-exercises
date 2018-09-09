#lang sicp
(#%require "cont-frac.scm")
(#%require racket/math)

; Exercise 1.39:
; ==============
; A continued fraction representation of the tangent function was published in
; 1770 by the German mathematician J.H. Lambert:
; 
; tan x = x / (1 - x^2 / (3 - x^2 / (5 - ...)))
;
; where x is in radians. Define a procedure (tan-cf x k) that computes an
; approximation to the tangent function based on Lambert’s formula. k specifies
; the number of terms to compute, as in Exercise 1.37


(define (tan-cf x k)
  (define (ni i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (di i)
    (- (* 2 i) 1))
  (cont-frac ni di k))

(tan-cf 0 10) ;0 (should be 0)
(tan-cf pi 10) ;-1.893214149359168e-009 (0)
(tan-cf (/ pi 4) 10) ;1.0 (1)
