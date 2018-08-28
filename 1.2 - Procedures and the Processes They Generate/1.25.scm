#lang sicp

; Exercise 1.25:
; ==============
; Alyssa P. Hacker complains that we went to a lot of extra work in writing
; expmod. Aer all, she says, since we already know how to compute exponentials,
; we could have simply wrien
 
; (define (expmod base exp m)
;   (remainder (fast-expt base exp) m))
; (trace expmod)
 
; Is she correct? Would this procedure serve as well for our fast prime tester?
; Explain.



; When we check for larger primes, the exponent gets big very quickly (the
; exponent could be almost as big as the number we are checking for primality).
; This means the simpler expmod procedure wouldn't be very efective for large
; numbers. This is, because first, it computes the entire exponent.
; Let's look at the other expmod procedure:
;
; (define (expmod base exp m)
;   (cond ((= exp 0) 1)
;         ((even? exp)
;          (remainder
;           (square (expmod base (/ exp 2) m))
;           m))
;         (else
;          (remainder
;           (* base (expmod base (- exp 1) m))
;           m))))
; 
; The other expmod succesively calculates the remainder every time the
; base is multiplied, so the result remains relatively small. We can do this,
; because we can continuously "eliminate" multiples of m - the last call to
; remainder would have done the same anyway.