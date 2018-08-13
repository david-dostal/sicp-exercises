#lang sicp
(#%require "prime.scm")

; Exercise 1.22:
; ==============
; Most Lisp implementations include a primitive called runtime that returns an
; integer that specifies the amount of time the system has been running
; (measured, for example, in microseconds). e following timed-prime-test
; procedure, when called with an integern, prints n and checks to see if n is
; prime. If n is prime, the procedure prints three asterisks followed by the
; amount of time used in performing the test.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your procedure
; to find the three smallest primes larger than 1000; larger than 10,000; larger
; than 100,000; larger than 1,000,000.
; 
; Note the time needed to test each prime. Since the testing algorithm has order
; of growth of O(√n), you should expect that testing for primes around 10,000
; should take about √10 times as long as testing for primes around 1000.
; 
; Do your timing data bear this out? How well do the data for 100,000 and
; 1,000,000 support the O(√n) prediction? Is your result compatible with the
; notion that programs on your machine run in time proportional to the number of
; steps required for the computation?



(define (search-for-primes from to)
  (define (search current)
    (cond ((<= current to) (timed-prime-test current)
                           (search (+ 2 current)))))
  (search (if (odd? from) from (+ 1 from))))

(search-for-primes 1000 1050)
; Three primes > 1000 are: 1009, 1013, 1019.

(search-for-primes 10000 10050)
; Three primes > 10,000 are: 10007, 10009, 10037.

(search-for-primes 1000000 1000050)
; Three primes > 100,000 are: 1000003, 1000033, 100037.

(search-for-primes 10000000 10000150)
; Three primes > 1,000,000 are: 10000019, 10000079, 10000103.

; The time required to test for primality is 0 for the given size of primes,
; so let's increase the size of the numbers a bit:

(search-for-primes 100000000 100000100) ; 10^8
; running times around 1000
; expected number of operations: 10,000
; time per operation: 0.1

(search-for-primes 1000000000 1000000100) ; 10^9
; running times around 2000
; expected number of operations: 32,000
; time per operation: 0.06

(search-for-primes 10000000000 10000000100) ; 10^10
; running times around 6000 - 7000
; expected number of operations: 100,000
; time per operation: 0.06 - 0.07

(search-for-primes 100000000000 100000000100) ; 10^11
; running times around 19,000 - 20,000
; expected number of operations: 320,000
; time per operation: 0.059 - 0.062

(search-for-primes 1000000000000 1000000000200) ; 10^12
; running times around 60,000 - 80,000
; expected number of operations: 1,000,000
; time per operation: 0.06 - 0.08


; As we can see, the timing data corresponds with our prediction of O(√n)
; growth. The number of operations grows approximately by √10 ≈ 3.16 when
; multiplying the number of steps by 10, the time per operation remains
; approximately constant for different values of n.
; 
; We can also see the timing data don't reflect our prediction exactly and they
; vary a bit each time we run the program. For smaller numbers of n, the
; measurements seem a bit off and the time per operation seems larger. This
; could be caused by the small overhead of procedure calls in the timing
; procedure, which gets insignificant when compared to larger running times.
