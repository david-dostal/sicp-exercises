#lang sicp

; Exercise 2.24:
; ==============
; Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the
; result printed by the interpreter, the corresponding box-and-pointer
; structure, and the interpretation of this as a tree (as in Figure 2.6).



; # Output of interpreter:
; (1 (2 (3 4)))


; # Box and pointer notation:
; I used the cons notation instead of boxes and pointers, because it is easier
; to write down without using some fancy ASCII art.
; 
(cons 1 (cons (cons 2 (cons (cons 3 (cons 4 nil)) nil)) nil))


; # Tree interpretation:
; 
;  /\
; 1 /\
;  2 /\
;   3  4