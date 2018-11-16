#lang sicp

; Exercise 2.46:
; ==============
; A two-dimensional vector v running from the origin to a point can be
; represented as a pair consisting of an x-coordinate and a y-coordinate.
; Implement a data abstraction for vectors by giving a constructor make-vect and
; corresponding selectors xcor-vect and ycor-vect.
; In terms of your selectors and constructor, implement procedures add-vect,
; sub-vect, and scale-vect that perform the operations vector addition, vector
; subtraction, and multiplying a vector by a scalar:
; 
; (x1, y1) + (x2, y2) = (x1 + x2, y1 + y2)
; (x1, y1) - (x2, y2) = (x1 - x2, y1 - y2)
; s * (x, y) = (sx, sy)


; Constructor and selectors
(define (make-vect x y)
  (list x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))


; Vector operations
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vect (* (xcor-vect v) s)
             (* (ycor-vect v) s)))

(define (sub-vect v1 v2)
  (add-vect v1 (scale-vect v2 -1)))


; Example usage
(define x (make-vect 4 5))
(define y (make-vect 2 7))

(display (add-vect x y)) ;(6 12)
(newline)
(display (sub-vect x y)) ;(2 -2)
(newline)
(display (scale-vect x 3)) ;(12 15)
(newline)
