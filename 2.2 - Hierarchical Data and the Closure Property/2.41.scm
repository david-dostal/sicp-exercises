#lang sicp
(#%require "enumerate-interval.scm")
(#%require "flatmap.scm")
(#%require "filter.scm")
(#%require "accumulate.scm")

; Exercise 2.41:
; ==============
; Write a procedure to find all ordered triples of distinct positive integers
; i, j, and k less than or equal to a given integer n that sum to a given
; integer s.



(define (remove item lst)
  (define (cons-if-different x rest)
    (if (equal? x item) rest (cons x rest)))
  (accumulate cons-if-different nil lst))

(define (k-permutations k lst)
  (if (= k 0)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (perm) (cons x perm))
                      (k-permutations (- k 1) (remove x lst))))
               lst)))

(define (triples-with-sum sum max)
  (define (correct-sum? triple) (= sum (accumulate + 0 triple)))
  (filter correct-sum?
          (k-permutations 3 (enumerate-interval 1 max))))

(display (triples-with-sum 8 5))
;((1 2 5) (1 3 4) (1 4 3) (1 5 2) (2 1 5) (2 5 1) (3 1 4) (3 4 1) (4 1 3)
;(4 3 1) (5 1 2) (5 2 1))
(newline)
(newline)


; I am not sure, if the authors of the book meant to find all different ordered
; triples with a given sum - for example (1 2 3) and (2 1 3) are different
; ordered triples, or just all triples of integers with a given sum in general
; (since that would make use of the previous exercise). The solution above
; considers all 3-element permutations of distinct integers.

; Below is a solution based on the previous exercise.

(define (unique-triples i)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list k j i))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 i)))


(define (triples-with-sum-2 sum max)
  (define (correct-sum? triple) (= sum (accumulate + 0 triple)))
  (filter correct-sum? (unique-triples max)))

(display (triples-with-sum-2 8 5))
;((1 3 4) (1 2 5))
(newline)
