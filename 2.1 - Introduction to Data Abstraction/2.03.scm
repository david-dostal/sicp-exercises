#lang sicp
(#%require "2.02.scm")
(#%require "square.scm")

; Exercise 2.03:
; ==============
; Implement a representation for rectangles in a plane. (Hint: You may want to
; make use of Exercise 2.2.) In terms of your constructors and selectors, create
; procedures that compute the perimeter and the area of a given rectangle.
;
; Now implement a different representation for rectangles. Can you design your
; system with suitable abstraction barriers, so that the same perimeter and area
; procedures will work using either representation?


(define (perimeter-rect rect)
  (* 2 (+ (width-rect rect)
          (height-rect rect))))

(define (area-rect rect)
  (* (width-rect rect)
     (height-rect rect)))

; Rectangle defined by 2 adjacent sides
(define (make-rect a b) (cons a b))
(define (width-rect rect) (len-segment (car rect)))
(define (height-rect rect) (len-segment (cdr rect)))

(define (len-segment segment)
  (distance-point (start-segment segment)
                  (end-segment segment)))

(define (distance-point p1 p2)
  (sqrt (+ (square (- (x-point p1)
                      (x-point p2)))
           (square (- (y-point p1)
                      (y-point p2))))))

; Rectangle defined by 2 diagonal lines
(define (make-rect-2 d1 d2) (cons d1 d2))
(define (width-rect-2 rect)
  (distance-point (start-segment (car rect))
                  (end-segment (cdr rect))))
(define (height-rect-2 rect)
  (distance-point (start-segment (car rect))
                  (start-segment (cdr rect))))

; Rectangle defined by 3 corners
(define (make-rect-3 c1 c2 c3) (cons c1 (cons c2 c3)))
(define (width-rect-3 rect)
  (distance-point (car rect) (car (cdr rect))))
(define (height-rect-3 rect)
  (distance-point (car rect) (cdr (cdr rect))))

; Rectangle defined by 2 corners and height
(define (make-rect-4 c1 c2 h) (cons c1 (cons c2 h)))
(define (width-rect-4 rect)
  (distance-point (car rect) (car (cdr rect))))
(define (height-rect-4 rect) (cdr (cdr rect)))

; This is the 'simplest' representation of a rectangle, with no duplicate data.
; In general we can define a rectangle using at least five numbers, for example
; using two points (with x and y coordinates) and a height.
