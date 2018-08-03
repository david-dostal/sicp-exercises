#lang sicp
(#%require "square-roots.scm")

; Exercise 1.7:
; =============
; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed
; with limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small
; and large numbers.
;
; An alternative strategy for implementing good-enough? is to watch how
; guess changes from one iteration to the next and to stop when the change is a
; very small fraction of the guess. Design a square-root procedure that uses
; this kind of end test. Does this work better for small and large numbers?


; When finding the square root of very small numbers the guesses get inaccurate,
; because the tolerance of good-enough? is too big. Simply the accuracy we
; require isn't enough. We could improve accuracy, if we decrease the tolerance
; to a smaller number.

(sqrt 0.000004)
; should be:    0.02
; evaluates to: 0.03129261341049664

; When squaring big numbers, the roundoff can cause two numbers which should be
; different be the same after rounding. When we call improve the procedure can
; return the same number as in the previous iteration (due to roundoff). This
; means that although the guess isn't good enough, it never improves and thus
; causes the program to run forever.
; For example:

; (sqrt 40000000000000)
; runs forever

; If we trace the iteration, we can see the guess stops improving after a few
; iterations:
; 
; (sqrt 40000000000000)
; (sqrt-iter 1 40000000000000)
; (sqrt-iter 20000000000000.5 40000000000000)
; (sqrt-iter 10000000000001.25 40000000000000)
; (sqrt-iter 5000000000002.625 40000000000000)
; (sqrt-iter 2500000000005.3125 40000000000000)
; (sqrt-iter 1250000000010.6562 40000000000000)
; (sqrt-iter 625000000021.3281 40000000000000)
; (sqrt-iter 312500000042.66406 40000000000000)
; (sqrt-iter 156250000085.33203 40000000000000)
; (sqrt-iter 78125000170.66602 40000000000000)
; (sqrt-iter 39062500341.33301 40000000000000)
; (sqrt-iter 19531250682.6665 40000000000000)
; (sqrt-iter 9765626365.333214 40000000000000)
; (sqrt-iter 4882815230.666321 40000000000000)
; (sqrt-iter 2441411711.3308697 40000000000000)
; (sqrt-iter 1220714047.6471097 40000000000000)
; (sqrt-iter 610373407.6769549 40000000000000)
; (sqrt-iter 305219470.6657154 40000000000000)
; (sqrt-iter 152675261.9519701 40000000000000)
; (sqrt-iter 76468627.96753626 40000000000000)
; (sqrt-iter 38495859.14982617 40000000000000)
; (sqrt-iter 19767465.972897083 40000000000000)
; (sqrt-iter 10895496.458176367 40000000000000)
; (sqrt-iter 7283369.035975903 40000000000000)
; (sqrt-iter 6387666.480622388 40000000000000)
; (sqrt-iter 6324867.094485008 40000000000000)
; (sqrt-iter 6324555.328020961 40000000000000)
; (sqrt-iter 6324555.320336759 40000000000000)
; (sqrt-iter 6324555.320336759 4000000000000)


; Improved good-enough?:

(define (good-enough-2? guess lastguess x)
  (< (abs (- guess lastguess))
     0.000001))

(define (sqrt-iter-2 guess x)
  (if (good-enough-2? (improve guess x) guess x)
      guess
      (sqrt-iter-2 (improve guess x) x)))

(define (sqrt-2 x) (sqrt-iter-2 1 x))

; We can see the program now stops if it doesn't improve anymore and the roots
; of small numbers are more accurate.

(sqrt-2 4000000000000000)
; 63245553.203367814

(sqrt 0.000004)
; 0.03129261341049664

(sqrt-2 0.000004)
; 0.0020000003065983023
