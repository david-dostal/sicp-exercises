#lang sicp
(#%provide (all-defined))

; Code for chapter 1.2 - Procedures and processes they generate
; =============================================================


; # Factorial - recursion

(define (fact-rec n)
  (if (= n 1)
      1
      (* n (fact-rec (- n 1)))))


; # Factorial - iteration

(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))
