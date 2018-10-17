#lang sicp

; Exercise 2.26:
; ==============
; Suppose we define x and y to be two lists:
(define x (list 1 2 3))
(define y (list 4 5 6))

; What result is printed by the interpreter in response to evaluating each of
; the following expressions:
; (append x y)
; (cons x y)
; (list x y)




(display (append x y))
; (1 2 3 4 5 6) ; concatenate two lists
(newline)

(display (cons x y))
; ((1 2 3) 4 5 6) ; prepend first list to second
(newline)

(display (list x y))
; ((1 2 3) (4 5 6)) ; create a list containing two lists
(newline)
