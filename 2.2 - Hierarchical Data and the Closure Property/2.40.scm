#lang sicp
(#%require "enumerate-interval.scm")
(#%require "flatmap.scm")
(#%require "filter.scm")
(#%require "prime.scm")

; Exercise 2.40:
; ==============
; Define a procedure unique-pairs that, given an integer n, generates the
; sequence of pairs (i, j) with 1 <= j < i <= n.
; Use unique-pairs to simplify the definition of prime-sum-pairs given above.




(define (unique-pairs i)
  (flatmap
   (lambda (i) (map (lambda (j) (list j i))
                    (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 i)))

(display (unique-pairs 4))
;((1 2) (1 3) (2 3) (1 4) (2 4) (3 4))
(newline)



(define (prime-sum-pairs n)
  (define (prime-pair? pair)
    (prime? (+ (car pair) (cadr pair))))
  (define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  
  (map make-pair-sum (filter prime-pair? (unique-pairs n))))

(display (prime-sum-pairs 4))
;((1 2 3) (2 3 5) (1 4 5) (3 4 7))
(newline)