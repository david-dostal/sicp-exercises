#lang sicp

; Exercise 1.4:
; =============
; Observe that our model of evaluation allows for combinations whose operators
; are compound expressions. Use this observation to describe the behavior of the
; following procedure:
;
; (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))

; What is interesting about this procedure is the usage of a compound expression
; as an operator. The expression (if (> b 0) + -) returns the operator + or -
; depending on a condition, which is afterward applied to the operands a and b.
;
; If b is positive (> 0), then the procedure returns a + b, else a - b.
; This means b is added when positive and subtracted when negative, which is by
; definition the absolute value of b.