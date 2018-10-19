#lang sicp
(#%require "square.scm")

; Exercise 2.30:
; ==============
; Define a procedure square-tree analogous to the square-list procedure of
; Exercise 2.21. That is, square-tree should behave as follows:

; (square-tree
;  (list 1
;        (list 2 (list 3 4) 5)
;        (list 6 7)))
; 
; (1 (4 (9 16) 25) (36 49))
; 
; Define square-tree both directly (i.e., without using any higher-order
; procedures) and also by using map and recursion.




(define (square-tree tree)
  (cond ((null? tree) nil)
        ((pair? tree)
         (cons (square-tree (car tree)) (square-tree (cdr tree))))
        (else (square tree))))


(define test-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display (square-tree test-tree))
;(1 (4 (9 16) 25) (36 49))
(newline)


(define (square-tree-2 tree)
  (cond ((null? tree) nil)
        ((pair? tree)
         (map square-tree-2 tree))
        (else (square tree))))

(display (square-tree-2 test-tree))
;(1 (4 (9 16) 25) (36 49))
(newline)
