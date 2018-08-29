#lang sicp
(#%require "fast-prime.scm")
(#%require "prime.scm")

; Exercise 1.27:
; ==============
; Demonstrate that the Carmichael numbers listed in Footnote 1.47 really do fool
; the Fermat test. at is, write a procedure that takes an integer n and tests
; whether a^n is congruent to a modulo n for every a < n, and try your procedure
; on the given Carmichael numbers.


; Given Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601

(define (fermat? n a)
  (= (expmod a n n) a))

(define (fermat-prime? n)
  (define (iter n a)
    (cond ((= a 3) true)
          ((fermat? n a) (iter n (- a 1)))
          (else false)))
  (iter n (- n 1)))

(fermat-prime? 561)  ;#t
(fermat-prime? 1105) ;#t
(fermat-prime? 1729) ;#t
(fermat-prime? 2465) ;#t
(fermat-prime? 2821) ;#t
(fermat-prime? 6601) ;#t

(fermat-prime? 17) ;#t
(fermat-prime? 18) ;#f
(newline)

; The procedure does detect carmichael numbers as prime, even though they
; aren't, which is the expected behavior. It does correctly detect real primes.
; We can take this a bit further and write a procedure, that tests whether a
; number is carmichael:

(define (carmichael? n)
  (and (fermat-prime? n)
       (not (prime? n))))

(carmichael? 561)  ;#t
(carmichael? 1105) ;#t
(carmichael? 1729) ;#t
(carmichael? 2465) ;#t
(carmichael? 2821) ;#t
(carmichael? 6601) ;#t

(carmichael? 17) ;#f
(carmichael? 18) ;#f
