#lang sicp
(#%require "2.07.scm")

; Exercise 2.10:
; ==============
; Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and
; comments that it is not clear what it means to divide by an interval that
; spans zero.
;
; Modify Alyssa’s code to check for this condition and to signal an error if it
; occurs.



(define (div-interval x y)
  (if (spans-zero? y)
      (error "Cannot divide by interval spanning zero - DIV-INTERVAL" y)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (spans-zero? interval)
  (and (<= (lower-bound interval) 0)
       (>= (upper-bound interval) 0)))


(div-interval (make-interval 2 4) (make-interval -3 3))
;!! Cannot divide by interval spanning zero - DIV-INTERVAL {-3 . 3}