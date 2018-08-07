#lang sicp
(#%require "1.17.scm")

; Exercise 1.18:
; ==============
; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.

(define (fast*-iter a b)
  (define (iter a b product)
    (cond ((= b 0) product)
          ((even? b) (iter (double a) (halve b) product))
          (else (iter a (- b 1) (+ product a)))))
  (iter a b 0))