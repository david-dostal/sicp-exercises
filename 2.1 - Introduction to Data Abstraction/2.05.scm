#lang sicp

; Exercise 2.05:
; ==============
; Showthatwe can represent pairs of nonnegative integers using only numbers and
; arithmetic operations if we represent the pair a and b as the integer that is
; the product 2^a * 3^b. Give the corresponding definitions of the procedures
; cons, car, and cdr.



; A pair of nonnegative integers can be represented as a number 2^a * 3^b,
; because we can get a and b by determining the prime factors of the number and
; counting, how many 2s and 3s there are. We could use any prime numbers as a
; base, but 2 and 3 are a good choice.
; 
; We can get the power of a given factor (for example 2 and 3) by repeatedly
; dividing by the factor, until the result isn't divisible by the factor and
; counting, how many divisions we performed.


(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (power-of-factor factor number)
  (define (iter power number)
    (if (= (remainder number factor) 0)
        (iter (+ power 1) (/ number factor))
        power))
  (iter 0 number))

(define (car number)
  (power-of-factor 2 number))

(define (cdr number)
  (power-of-factor 3 number))