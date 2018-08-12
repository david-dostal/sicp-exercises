#lang sicp

; Exercise 1.20:
; ==============
; e process that a procedure generates is of course dependent on the rules
; used by the interpreter. As an example, consider the iterative gcd procedure
; given above. Suppose we were to interpret this procedure using normal-order
; evaluation, as discussed in Section 1.1.5. (e normal-order-evaluation rule
; for if is described in Exercise 1.5.)
; Using the substitution method (for normal order), illustrate the process
; generated in evaluating (gcd 206 40) and indicate the remainder operations
; that are actually performed. How many remainder operations are actually
; performed in the normal-order evaluation of (gcd 206 40)? In the
; applicative-order evaluation?

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


; # Normal order evaluation:
(gcd 206 40)
(gcd 40 (remainder 206 40))
(= (remainder 206 40) 0) ; if test evaluates to false
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(= (remainder 40 (remainder 206 40)) 0) ; false
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; false
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(= (remainder (remainder 40 (remainder 206 40))
              (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
   0) ; true
(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 2

; 4 remainder operations in reduction phase
; (1 + 2 + 4 + 7) = 14 operations in if tests
; 18 remainder operations in total


; # Applicative order evaluation:
(gcd 206 40) ;(remainder 206 40) -> 6
(gcd 40 6)   ;(remainder 40 6) -> 4
(gcd 6 4)    ;(remainder 6 4) -> 2
(gcd 4 2)    ;(remainder 4 2) -> 0
(gcd 2 0)    ; a -> 2

; 4 reminder operations