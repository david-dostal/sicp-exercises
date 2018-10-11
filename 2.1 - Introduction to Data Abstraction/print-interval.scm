#lang sicp
(#%require "2.07.scm")
(#%require "2.08.scm")
(#%require "2.12.scm")
(#%provide (all-defined))

; Display an interval:
; ====================

(define (print-tuple a b)
  (display "(")
  (display a)
  (display ", ")
  (display b)
  (display ")")
  (newline))

(define (print-interval i)
  (print-tuple (lower-bound i)
               (upper-bound i)))

(define (print-center-percent i)
  (print-tuple (center i)
               (percent i)))