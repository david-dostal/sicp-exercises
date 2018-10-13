#lang sicp

; Exercise 2.17:
; ==============
; Define a procedure last-pair that returns the list that contains only the last
; element of a given (nonempty) list:

; (last-pair (list 23 72 149 34))
; (34)



(define (last-pair list)
  (let ((rest (cdr list)))
    (if (null? rest)
        (car list)
        (last-pair rest))))

(last-pair (list 23 72 149 34)) ;34
