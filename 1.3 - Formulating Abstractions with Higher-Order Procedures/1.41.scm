#lang sicp

; Exercise 1.41:
; ==============
; Define a procedure double that takes a procedure of one argument as argument
; and returns a procedure that applies the original procedure twice. For
; example, if inc is a procedure that adds 1 to its argument, then (double inc)
; should be a procedure that adds 2. What value is returned by
; (((double (double double)) inc) 5)?



(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)

; (The expansion is just illustrative.)
; (((double (double double)) inc) 5)
; (((double 4-times) inc) 5)
; (((4-times 4-times) inc) 5)
; ((16-times inc) 5)
; should be 21


; Note:
; Initially I thought, the result should be 13, because (double 4-times)
; should add 8. But the procedure doesn't multiply by 2 in the matematical
; sense, it applies the given procedure twice. This means the result of
; (double 4-times) is (4-times (4-times x)), not (* 2 (quadruple x)).