#lang sicp

; Exercise 1.31:
; ==============
; a. e sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to π using the formula
; 
; π/4 = (2/3) * (4/3) * (4/5) * (6/5) * (6/7) * (8/7) * ...
; 
; b. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.


; a.
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (add1 x) (+ 1 x))
(define (id x) x)

(define (fact x)
  (product-rec id 1 add1 x))

(define (pi iterations)
  (define (term a)
    (if (even? a)
        (/ (+ 2 a) (+ 1 a))
        (/ (+ 1 a) (+ 2 a)))) ; zero-indexed
  (* 4 (product-rec term 1.0 add1 iterations)))

; b.
(define (product-iter term a next b)
  (define (iter a product)
    (if (> a b)
        product
        (iter (next a) (* product (term a)))))
  (iter 1 1))