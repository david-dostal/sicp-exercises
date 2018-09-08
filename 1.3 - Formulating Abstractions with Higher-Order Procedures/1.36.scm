#lang sicp

; Exercise 1.36:
; ==============
; Modify fixed-point so that it prints the sequence of approximations it
; generates, using the newline and display primitives shown in Exercise 1.22.
; 
; Then find a solution to x^x = 1000 by finding a fixed point of
; x -> log(1000) / log(x). (Use Scheme’s primitive log procedure, which computes
; natural logarithms.)
;
; Compare the number of steps this takes with and without average damping. (Note
; that you cannot start fixed-point with a guess of 1, as this would cause
; division by log(1) = 0.)



(define (fixed-point f first-guess tolerance)
  (define (close-enough? a b)
    (< (abs (- a b))
       tolerance))
  (define (try x)
    (display x)
    (newline)
    (let ((next (f x)))
      (if (close-enough? x next)
          next
          (try next))))
  (try first-guess))

"Fixed point:"
(define (next x)
  (/ (log 1000)
     (log x)))

(fixed-point next 2 0.00001)

"With average damping:"
(define (average a b) (/ (+ a b) 2))

(fixed-point (lambda (x) (average x (next x))) 2 0.00001)


; The number of steps with average damping is significantly smaller than
; without (35 vs 10 iterations). With average damping the approximations don't
; oscillate around the right answer, but converge from one side.
; 
; This doesn't just make it faster, but also makes sure the results don't start
; diverging or get stuck in an infinite loop.