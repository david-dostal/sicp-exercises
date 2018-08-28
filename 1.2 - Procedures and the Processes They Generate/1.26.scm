#lang sicp

; Exercise 1.26:
; ==============
; Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime?
; test seems to run more slowly than his prime? test. Louis calls his friend Eva
; Lu Ator over to help. When they examine Louis’s code, they find that he has
; rewrien the expmod procedure to use an explicit multiplication, rather than
; calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; "I don’t see what difference that could make," says Louis. "I do." says Eva.
; "By writing the procedure like that, you have transformed the O(log n) process
; into a O(n) process." Explain.



; It is pretty obvious, that the replacement of square by explicit
; multiplication causes the operands to be evaluated twice, rather than once as
; an argument to square (thanks to applicative order evaluation). But the story
; doesn't end here, because the procedure isn't just twice as slow, it has a
; whole different time complexity.
; 
; Why? Because expmod is a recursive procedure. Each time we recurse, the
; recursion has turned from a previous linear recursion to tree recursion (two
; whole new duplicate branches get created every time we recurse, those branches
; create branches themselves etc.).
; 
; The depth of recursion is still log(n), but the number of branches is
; exponential. Every time we try to save time by squaring instead of repetitive
; multiplication, the benefits get cancelled out by the fact, that whereever we
; cut the exponent in half, the number of operations gets doubled.
;
; Mathematically, if the depth of recursion is approximately log2(n) and each
; branch takes 2^n steps to compute, then the time taken is log2(2^n) = n.