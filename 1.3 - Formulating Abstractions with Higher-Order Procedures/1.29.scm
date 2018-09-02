#lang sicp
(#%require "sum.scm")
(#%require "cube.scm")

; Exercise 1.29:
; ==============
; Simpson’s Rule is a more accurate method of numerical integration than the
; method illustrated above. Using Simpson’s Rule, the integral of a function f
; between a and b is approximated as
; 
; (h/3) * (y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + . . . + 2y_n-2 + 4y_n-1 + y_n)
; 
; where h = (b - a) / n, for some even integer n, and y_k = f (a + kh).
; (Increasing n increases the accuracy of the approximation.)
;
; Define a procedure that takes as arguments f , a, b, and n and returns the
; value of the integral, computed using Simpson’s Rule. Use your procedure to
; integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the
; results to those of the integral procedure shown above.


(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (y_k k) (f (+ a (* k h))))
  (define (next x) (+ x 1))
  (define (multiplier k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (term k) (* (multiplier k) (y_k k)))
  (* (/ h 3) (sum term 0 next n)))

(simpson-integral cube 0.0 1.0 100)  ;0.24999999999999992
(simpson-integral cube 0.0 1.0 1000) ;0.2500000000000003

; shown above:
; 0.24998750000000042
; 0.249999875000001

; The simpson-integral converges on the result much faster.