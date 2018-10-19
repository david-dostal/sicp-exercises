#lang sicp
(#%provide accumulate)

; Accumulate
; ==========

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))