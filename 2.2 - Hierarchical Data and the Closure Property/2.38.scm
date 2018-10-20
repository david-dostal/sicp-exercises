#lang sicp
(#%require "accumulate.scm")

; Exercise 2.38:
; ==============
; The accumulate procedure is also known as fold-right, because it combines the
; first element of the sequence with the result of combining all the elements to
; the right. There is also a fold-left, which is similar to fold-right, except
; that it combines elements working in the opposite direction:

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; What are the values of
; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))
; (fold-right list nil (list 1 2 3))
; (fold-left list nil (list 1 2 3))
;
; Give a property that op should satisfy to guarantee that fold-right and
; fold-left will produce the same values for any sequence.





(define fold-right accumulate)

; (fold-right / 1 (list 1 2 3))
; 3/2

; (fold-left / 1 (list 1 2 3))
; 1/6

; (fold-right list nil (list 1 2 3))
; (1 (2 (3 ())))

; (fold-left list nil (list 1 2 3))
; (((() 1) 2) 3)


; To guarantee that fold-right and fold-left will produce the same values for
; any sequence, it is necessary that (op (op a b) c) = (op a (op b c)), or in
; other words op needs to be associative.
;
; Looking at solutions from other people to this exercise, most of them stated
; op needs to be commutative, but I don't believe this is true. Let me show an
; example - string concatenation.
;
; String concatenation is obviously not commutative - "a" + "b" is not the same
; as "b" + "a", but it is associative - ("a" + "b") + "c") is the same as
; "a" + ("b" + "c").
; 
; And, as we can see, fold-left and fold-right produce the same output for
; concatenating strings (it doesn't matter, if we append them from left to right
; or right to left):

(fold-left string-append "" (list "a" "b" "c" "d"))
;"abcd"

(fold-right string-append "" (list "a" "b" "c" "d"))
;"abcd"
