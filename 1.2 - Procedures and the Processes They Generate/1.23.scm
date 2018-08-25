#lang sicp
(#%require "smallest-divisor.scm")
(#%require "prime.scm")

; Exercise 1.23:
; ==============
; e smallest-divisor procedure shown at the start of this section does lots of
; needless testing: Aer it checks to see if the number is divisible by 2 there
; is no point in checking to see if it is divisible by any larger even numbers.
; is suggests that the values used for test-divisor should not be 2, 3, 4, 5,
; 6, ..., but rather 2, 3, 5, 7, 9, ....
; To implement this change, define a procedure next that returns 3 if its input
; is equal to 2 and otherwise returns its input plus 2. Modify the
; smallest-divisor procedure to use (next test-divisor) instead of
; (+ test-divisor 1).
; With timed-prime-test incorporating this modified version of smallest-divisor,
; run the test for each of the 12 primes found in Exercise 1.22. Since this
; modification halves the number of test steps, you should expect it to run
; about twice as fast. Is this expectation confirmed? If not, what is the
; observed ratio of the speeds of the two algorithms, and how do you explain the
; fact that it is different from 2?


(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (smallest-divisor-2 n)
  (define (iter n divisor)
    (cond ((> (* divisor divisor) n) n)
          ((divides? divisor n) divisor)
          (else (iter n (next divisor)))))
  (iter n 2))

(define (prime-2? n)
  (= n (smallest-divisor-2 n)))

(define (timed-prime-test n f)
  (* 1.0 (start-prime-test n (runtime) f)))

(define (start-prime-test n start-time f)
  (if (f n)
      (- (runtime) start-time)))


(/ (timed-prime-test 1000000007 prime?)
   (timed-prime-test 1000000007 prime-2?))
(/ (timed-prime-test 1000000009 prime?)
   (timed-prime-test 1000000009 prime-2?))
(/ (timed-prime-test 1000000021 prime?)
   (timed-prime-test 1000000021 prime-2?))
(newline)
; ratio around 1.0 - 2.0

(/ (timed-prime-test 10000000019 prime?)
   (timed-prime-test 10000000019 prime-2?))
(/ (timed-prime-test 10000000033 prime?)
   (timed-prime-test 10000000033 prime-2?))
(/ (timed-prime-test 10000000061 prime?)
   (timed-prime-test 10000000061 prime-2?))
(newline)
; ratio around 1.0 - 1.4

(/ (timed-prime-test 100000000003 prime?)
   (timed-prime-test 100000000003 prime-2?))
(/ (timed-prime-test 100000000019 prime?)
   (timed-prime-test 100000000019 prime-2?))
(/ (timed-prime-test 100000000057 prime?)
   (timed-prime-test 100000000057 prime-2?))
(newline)
; ratio around 1.2 - 1.3

(/ (timed-prime-test 1000000000039 prime?)
   (timed-prime-test 1000000000039 prime-2?))
(/ (timed-prime-test 1000000000061 prime?)
   (timed-prime-test 1000000000061 prime-2?))
(/ (timed-prime-test 1000000000063 prime?)
   (timed-prime-test 1000000000063 prime-2?))
(newline)
; ratio around 1.2 - 1.3


; If we use the new smallest-divisor procedure, the code runs approximately 1.2
; to 1.3 times faster. There is a measurable improvement, but the code doesn't
; run twice as fast. I suppose that could be caused partially by the overhead
; for calling next, which is not a builtion procedure like + and by the fact,
; that the condition in next takes some time too.
; 
; Let's find out, if the explanations are correct. If we replace the body of
; our next procedure with (+ x 1) instead of the condition, our new code is
; slower than the original (approximately 0.65 times the speed).

; (define (next x))
;   (+ x 1))

; This confirms that there is a noticeable overhead just for calling the
; procedure. Now we can add back a condition to next, but still keep checking
; odd numbers:
;
; (define (next x)
;   (if (= x 2)
;       (+ x 1)
;       (+ x 1)))
;
; I wasn't able to see any noticeable difference (our new code is still about
; 0.65 times slower), so the hypothesis that the introduction of a condition
; has a noticeable performance impact is probably false. See, it is good to
; check your assumptions and is doesn't have to be hard either :-)
