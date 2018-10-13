#lang sicp

; Exercise 2.18:
; ==============
; Define a procedure reverse that takes a list as argument and returns a list of
; the same elements in reverse order:

; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)



(define (reverse list)
  (define (iter list reversed)
    (if (null? list)
        reversed
        (iter (cdr list)
              (cons (car list) reversed))))
  (iter list nil))

(display (reverse (list 1 4 9 16 25)))
;(25 16 9 4 1)

; Note: a recursive solution using append would be less computationally
; effective, because append takes O(n) time and cons only O(1).