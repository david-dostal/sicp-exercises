#lang sicp
(#%require "compose.scm")
(#%provide repeated)

; Repeatedly apply function:
; ==========================

(define (repeated f n)
  (if (> n 0)
      (compose f (repeated f (- n 1)))
      identity))