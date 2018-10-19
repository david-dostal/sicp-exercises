#lang sicp
(#%require "accumulate.scm")
(#%require "square.scm")

; Exercise 2.33:
; ==============
; Fill in the missing expressions to complete the following definitions of some
; basic list-manipulation operations as accumulations:

; (define (map p sequence)
;   (accumulate (lambda (x y) <??>) nil sequence))

; (define (append seq1 seq2)
;   (accumulate cons <??> <??>))

; (define (length sequence)
;   (accumulate <??> 0 sequence))




(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(display (map square (list 1 2 3 4 5)))
;(1 4 9 16 25)
(newline)


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(display (append (list 1 2 3 4 5) (list 6 7 8 9 10)))
;(1 2 3 4 5 6 7 8 9 10)
(newline)


(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(display (length (list 1 2 3 4 5)))
;5
(newline)
