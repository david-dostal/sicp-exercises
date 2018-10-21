#lang sicp
(#%require "accumulate.scm")

; Exercise 2.39:
; ==============
; Complete the following definitions of reverse (Exercise 2.18) in terms of
; fold-right and fold-left from Exercise 2.38:

; (define (reverse sequence)
;   (fold-right (lambda (x y) <??>) nil sequence))

; (define (reverse sequence)
;   (fold-left (lambda (x y) <??>) nil sequence))




(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))


(display (reverse (list 1 2 3 4 5)))
;(5 4 3 2 1)
(newline)

(display (reverse-2 (list 1 2 3 4 5)))
;(5 4 3 2 1)
(newline)
