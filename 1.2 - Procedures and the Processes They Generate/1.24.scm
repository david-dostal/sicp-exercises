#lang sicp
(#%require "fast-prime.scm")
(#%require "find-primes.scm")

; Exercise 1.24:
; ==============
; Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime?
; (the Fermat method), and test each of the 12 primes you found in that
; exercise. Since the Fermat test has O(log n) growth, how would you expect the
; time to test primes near 1,000,000 to compare with the time needed to test
; primes near 1000? Do your data bear this out? Can you explain any discrepancy
; you find?

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; 10^10
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
(newline)
; around 7,000

; 10^20
(timed-prime-test 100000000000000000039) 
(timed-prime-test 100000000000000000129)
(timed-prime-test 100000000000000000151)
(newline)
; around 25,000 - 70,000

; 10^40
(timed-prime-test 10000000000000000000000000000000000000121)
(timed-prime-test 10000000000000000000000000000000000000139)
(timed-prime-test 10000000000000000000000000000000000000301)
(newline)
; around 95,000 - 150,000

; 10^80
(timed-prime-test 100000000000000000000000000000000000000000000000000000000000000000000000000000129)
(timed-prime-test 100000000000000000000000000000000000000000000000000000000000000000000000000000349)
(timed-prime-test 100000000000000000000000000000000000000000000000000000000000000000000000000000661)
(newline)
; around 310,000

; 10^160
(timed-prime-test 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000303)
(timed-prime-test 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000649)
(timed-prime-test 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001239)
(newline)
; around 850,000


; I would expect (fast-prime 1000000) to run approximately 2 times longer than
; (fast-prime 1000), because log(1000000) = 6, log(1000) = 3. In my test I used
; bigger primes, because else the running times are too small to notice.
; 
; As we double the exponent, the running time approximately doubles too, but it
; seems to be a bit more - around 3 times as long. This is still logarithmic
; time, which is great - with a linear running time, checking such big primes
; would be impossible.
; 
; I suspect the cause for the tripling instead of doubling could be caused by
; the fact, that operating on very large numbers (such as squaring in the expmod
; procedure) isn't a precisely constant operation - it takes longer as the
; numbers get very large.