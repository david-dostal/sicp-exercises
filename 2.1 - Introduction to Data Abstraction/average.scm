#lang sicp
(#%provide average)

; Average of 2 numbers:
; =====================

(define (average a b)
  (/ (+ a b) 2))