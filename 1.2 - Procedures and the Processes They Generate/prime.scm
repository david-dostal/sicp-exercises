#lang sicp
(#%require "smallest-divisor.scm")
(#%provide (all-defined))

; Primality check
; ===============

(define (prime? n)
  (= n (smallest-divisor n)))