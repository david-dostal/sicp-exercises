#lang sicp

; Exercise 1.11:
; ==============
; A function f is defined by the rule that
; 
; f(n) = n if n < 3,
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3.
; 
; Write a procedure that computes f by means of a recursive process. Write a
; procedure that computes f by means of an iterative process.



; Recursive

(define (f n)
  (if (< n 3) n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


; Iterative

(define (f2 n)
  (define (iter n f1 f2 f3)
    (cond ((< n 2) n)
          ((= n 2) f3)
          (else (iter (- n 1)
                      f2
                      f3
                      (+ (* 3 f1) (* 2 f2) f3)))))
  (iter n 0 1 2))