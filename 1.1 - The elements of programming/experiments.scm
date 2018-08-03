#lang sicp

; What does a procedure evaluete to? What is printed as output?
; =============================================================

(define (f) 2)
(define (g x) x)
(g f)
; #<procedure:f>

; What happens if no conditions match?
; ====================================

(define (test)
  (cond (false 1)
        (false 2)
        (false 3)))
(g (test))
; nothing happens

(if (test) 1 0)
; it is not #f

(+ (test) 0)
; error, given #<void>


; Can we define a procedure conditionally?
; ========================================

(if true
    (define a 1)
    (define a 0))
a
; define: not allowed in an expression context
