#lang sicp

; Exercise 2.01:
; ==============
; Define a beer version of make-rat that handles both positive and negative
; arguments. make-rat should normalize the sign so that if the rational number
; is positive, both the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is negative.


(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (< d 0) -1 1)))
    (cons (* sign (/ n g)) (* sign (/ d g)))))