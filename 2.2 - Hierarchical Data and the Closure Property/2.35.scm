#lang sicp
(#%require "accumulate.scm")
(#%require "enumerate-tree.scm")

; Exercise 2.35:
; ==============
; Redefine count-leaves from Section 2.2.2 as an accumulation:
; 
; (define (count-leaves t)
;   (accumulate <??> <??> (map <??> <??>)))




(define (count-leaves t)
  (accumulate + 0 (map (lambda (tree)
                         (cond ((null? tree) 0)
                               ((pair? tree) (count-leaves tree))
                               (else 1)))
                       t)))

(count-leaves (list 1 (list 2 3) (list (list 4) 5)))
;5


; Using enumerate-tree:

(define (count-leaves-2 t)
  (accumulate + 0 (map (lambda (leaf) 1) (enumerate-tree t))))

(count-leaves-2 (list 1 (list 2 3) (list (list 4) 5)))
;5
