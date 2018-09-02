#lang sicp
(#%require (file "../1.2 - Procedures and the Processes They Generate/square.scm"))

; Exercise 1.34:
; ==============
; Suppose we define the procedure

(define (f g) (g 2))

; en we have

(f square) ;4
(f (lambda (z) (* z (+ z 1)))) ;6

; What happens if we (perversely) ask the interpreter to evaluate the
; combination (f f)? Explain.



; When we ask the interpreter to evaluate (f f), we get an error. Let's examine
; what happens:

(f f)
; f takes its argument (f) and applies it to the number 2:
(f 2)
; f takes its argument (2) and applies it to the number 2:
(2 2)
; 2 is not a procedure.