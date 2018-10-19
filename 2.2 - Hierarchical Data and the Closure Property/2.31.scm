#lang sicp
(#%require "square.scm")

; Exercise 2.31:
; ==============
; Abstract your answer to Exercise 2.30 to produce a procedure tree-map with the
; property that square-tree could be defined as
; 
; (define (square-tree tree) (tree-map square tree))




(define (tree-map fn tree)
  (cond ((null? tree) nil)
        ((pair? tree)
         (map (lambda (sub-tree) (tree-map fn sub-tree))
              tree))
        (else (fn tree))))

(define (square-tree tree) (tree-map square tree))

(define test-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display (square-tree test-tree))
;(1 (4 (9 16) 25) (36 49))
(newline)


(define (tree-map-2 fn tree)
  (define (recurse sub-tree)
    (cond ((null? sub-tree) nil)
          ((pair? sub-tree) (tree-map-2 fn sub-tree))
          (else (fn sub-tree))))
  (map recurse tree))

(define (square-tree-2 tree) (tree-map-2 square tree))
(display (square-tree test-tree))
;(1 (4 (9 16) 25) (36 49))
(newline)


; I noticed, we can either map over each sub-tree or the tree itself. This is
; because a sub-tree and a tree are both a tree, so it doesn't matter.
; I guess mapping over the tree is a bit more elegant, because we need to think
; mainly about the tree as a list of other trees and not so much about its
; subtrees.
; I defined a recurse function instead of using lambda, as is in the examples in
; the book, because I find it a bit easier to read and it is immediately clear,
; that we map a function over the list of subtrees. This is of course just my
; personal preference.
