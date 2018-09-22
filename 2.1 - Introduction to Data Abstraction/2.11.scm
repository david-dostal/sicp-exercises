#lang sicp
(#%require "2.07.scm")
(#%require "2.08.scm")

; Exercise 2.11:
; ==============
; In passing, Ben also cryptically comments: "By testing the signs of the
; endpoints of the intervals, it is possible to break mul-interval into nine
; cases, only one of which requires more than two multiplications." Rewrite this
; procedure using Ben’s suggestion.



(define (mul-interval-2 x y)
  (let ((x_a (lower-bound x))
        (x_b (upper-bound x))
        (y_a (lower-bound y))
        (y_b (upper-bound y)))
    (cond ((>= x_a 0)
           (cond ((>= y_a 0) (make-interval (* x_a y_a) (* x_b y_b)))
                 ((<= y_b 0) (make-interval (* x_b y_a) (* x_a y_b)))
                 (else (make-interval (* x_b y_a) (* x_b y_b)))))
          ((<= x_b 0)
           (cond ((>= y_a 0) (make-interval (* x_a y_b) (* x_b y_a)))
                 ((<= y_b 0) (make-interval (* x_b y_b) (* x_a y_a)))
                 (else (make-interval (* x_a y_b) (* x_a y_a)))))
          (else
           (cond ((>= y_a 0) (make-interval (* x_a y_b) (* x_b y_b)))
                 ((<= y_b 0) (make-interval (* x_b y_a) (* x_a y_a)))
                 (else (make-interval (min (* x_a y_b) (* x_b y_a))
                                      (max (* x_a y_a) (* x_b y_b)))))))))


; Tests to make sure we've made no mistake:
(define (test-mul a b c d)
  (let ((x (make-interval a b))
        (y (make-interval c d)))
    (if (not (eq-interval? (mul-interval x y)
                           (mul-interval-2 x y)))
        (error "Intervals not equal - TEST-MUL" x y))))

(define (eq-interval? x y)
  (and (= (lower-bound x) (lower-bound y))
       (= (upper-bound x) (upper-bound y))))

(test-mul 1 2 3 4)
(test-mul 1 2 0 4)
(test-mul 1 2 -4 -3)
(test-mul 1 2 -4 0)
(test-mul 1 2 -4 3)
(test-mul 1 2 0 0)
(test-mul 1 2 1 1)
(test-mul 1 2 -1 -1)

(test-mul 0 2 3 4)
(test-mul 0 2 0 4)
(test-mul 0 2 -4 -3)
(test-mul 0 2 -4 0)
(test-mul 0 2 -4 3)
(test-mul 0 2 0 0)
(test-mul 0 2 1 1)
(test-mul 0 2 -1 -1)

(test-mul -2 -1 3 4)
(test-mul -2 -1 0 4)
(test-mul -2 -1 -4 -3)
(test-mul -2 -1 -4 0)
(test-mul -2 -1 -4 3)
(test-mul -2 -1 0 0)
(test-mul -2 -1 1 1)
(test-mul -2 -1 -1 -1)

(test-mul -2 0 3 4)
(test-mul -2 0 0 4)
(test-mul -2 0 -4 -3)
(test-mul -2 0 -4 0)
(test-mul -2 0 -4 3)
(test-mul -2 0 0 0)
(test-mul -2 0 1 1)
(test-mul -2 0 -1 -1)

(test-mul -2 1 3 4)
(test-mul -2 1 0 4)
(test-mul -2 1 -4 -3)
(test-mul -2 1 -4 0)
(test-mul -2 1 -4 3)
(test-mul -2 1 -4 3)
(test-mul -2 1 1 1)
(test-mul -2 1 -1 -1)

(test-mul 0 0 3 4)
(test-mul 0 0 0 4)
(test-mul 0 0 -4 -3)
(test-mul 0 0 -4 0)
(test-mul 0 0 -4 3)
(test-mul 0 0 -4 3)
(test-mul 0 0 1 1)
(test-mul 0 0 -1 -1)

(test-mul 1 1 3 4)
(test-mul 1 1 0 4)
(test-mul 1 1 -4 -3)
(test-mul 1 1 -4 0)
(test-mul 1 1 -4 3)
(test-mul 1 1 -4 3)
(test-mul 1 1 1 1)
(test-mul 1 1 -1 -1)

(test-mul -1 -1 3 4)
(test-mul -1 -1 0 4)
(test-mul -1 -1 -4 -3)
(test-mul -1 -1 -4 0)
(test-mul -1 -1 -4 3)
(test-mul -1 -1 -4 3)
(test-mul -1 -1 1 1)
(test-mul -1 -1 -1 -1)
