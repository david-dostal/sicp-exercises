#lang sicp
(#%require (file "../1.2 - Procedures and the Processes They Generate/prime.scm"))
(#%require (file "../1.2 - Procedures and the Processes They Generate/gcd.scm"))
(#%require "square.scm")
(#%require "1.32.scm")

; Exercise 1.33:
; ==============
; You can obtain an even more general version of accumulate (Exercise 1.32) by
; introducing the notion of a filter on the terms to be combined. at is,
; combine only those terms derived from values in the range that satisfy a
; specified condition. e resulting filtered-accumulate abstraction takes the
; same arguments as accumulate, together with an additional predicate of one
; argument that specifies the filter.
; 
; Write filtered-accumulate as a procedure. Show how to express the following
; using filtered-accumulate:
; 
; a. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already wrien)
; 
; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i, n) = 1).


(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (filter a)
           (term a)
           null-value)
       (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (filtered-accumulate-iter filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

; alternative version using allready defined accumulate procedure
(define (filtered-accumulate-2 filter combiner null-value term a next b)
  (define (filtered-combiner a b)
    (if (filter a)
        (combiner a b)
        (combiner null-value b)))
  (accumulate-iter filtered-combiner null-value term a next b))

; a.
(define (sum-prime-squares a b)
  (define (filter a) (prime? a))
  (filtered-accumulate-iter filter + 0 square a add1 b))

(define (add1 x) (+ 1 x))

; b.
(define (product-rel-primes n)
  (define (filter a)
    (= (gcd a n) 1))
  (filtered-accumulate-iter filter * 1 identity 1 add1 n))
