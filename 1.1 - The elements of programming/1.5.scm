#lang sicp

; Exercise 1.5:
; =============
; Ben Bitdiddle has invented a test to determine whether the interpreter he is
; faced with is using applicative order evaluation or normal-order evaluation.
; He defines the following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; en he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order
; evaluation? What behavior will he observe with an interpreter that uses
; normal-order evaluation? Explain your answer.
; (Assume that the evaluation rule for the special form if is the same whether
; the interpreter is using normal or applicative order: e predicate expression
; is evaluated first, and the result determines whether to evaluate the
; consequent or the alternative expression.)


; The procedure definition (define (p) (p)) defines a procedure which upon
; evaluation tries to evaluate itself, which means evaluating itself, ... This
; leads to an infinite loop, when the procedure is called.

(test 0 p)
; infinite loop

; If the interpreter uses applicative-order it evaluates each argument upon
; application, thus (test 0 (p)) will go into an infinite loop. But if the
; interpreter uses normal order evaluation, (p) is not immediately evaluated.
; then the condition in test is met and test returns 0, never evaluating its
; second argument.

(test 0 p)
; 0

; The test could also be simplified a bit, for example:
(define (p) (p))
(define (test f) 0)
(test (p))

; The argument f in test is not used in the body of the procedure, which means
; if the interpreter uses normal-order evaluation, p is never called and test
; returns 0, otherwise (p) gets evaluated and causes an infinite loop.