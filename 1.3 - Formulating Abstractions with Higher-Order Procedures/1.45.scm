#lang sicp
(#%require "fixed-point.scm")
(#%require "repeated.scm")
(#%require "average-damp.scm")

; Exercise 1.45:
; ==============
; We saw in Section 1.3.3 that attempting to compute square roots by naively
; finding a fixed point of y -> x/y does not converge, and that this can be
; fixed by average damping. e same method works for finding cube roots as
; fixed points of the average-damped y -> x/y^2. Unfortunately, the process does
; not work for fourth roots — a single average damp is not enough to make a
; fixed-point search for y -> x/y^3 converge. On the other hand, if we average
; damp twice (i.e., use the average damp of the average damp of y -> x/y^3) the
; fixed-point search does converge.
;
; Do some experiments to determine how many average damps are required to
; compute nth roots as a fixedpoint search based upon repeated average damping
; of y -> x/y^(n-1). Use this to implement a simple procedure for computing nth
; roots using fixed-point, average-damp, and the repeated procedure of Exercise
; 1.43. Assume that any arithmetic operations you need are available as
; primitives.


; First, let't define a procedure co calculate the nth root of x with a given
; number of damps:

(define (root-test x degree damps)
  (fixed-point
   ((repeated average-damp damps)
    (lambda (y) (/ x (expt y (- degree 1)))))
   x))


; Now we want to find out the maximal degree of a root we can compute using a
; given number of damps:

(define (test base damps)
  (define (iter i)
    (display i)
    (display " root of ")
    (display (expt base i))
    (display " = ")
    (display (root-test (expt base i) i damps))
    (newline)
    (iter (+ i 1)))
  (iter 1))

; > (test 10 0)
; 1 root of 10 = 10
; 2 root of 100 = ?
; 
; > (test 10 1)
; 1 root of 10 = 10.0
; 2 root of 100 = 10.0
; 3 root of 1000 = 9.999996779686452
; 4 root of 10000 = ?
; 
; > (test 10 2)
; 1 root of 10 = 10.0
; 2 root of 100 = 10.000009833091557
; 3 root of 1000 = 10.000001031079556
; 4 root of 10000 = 10.0
; 5 root of 100000 = 9.999999309785903
; 6 root of 1000000 = 9.999996784001985
; 7 root of 10000000 = 10.00000387006958
; 8 root of 100000000 = ?
; 
; > (test 10 3)
; 1 root of 10 = 10.0
; 2 root of 100 = 10.00002265517531
; 3 root of 1000 = 10.000013221912454
; 4 root of 10000 = 10.000008420458055
; 5 root of 100000 = 10.00000244241545
; 6 root of 1000000 = 10.000002936843039
; 7 root of 10000000 = 10.000000482604644
; 8 root of 100000000 = 10.000000000000126
; 9 root of 1000000000 = 9.99999902432816
; 10 root of 10000000000 = 9.999998555697035
; 11 root of 100000000000 = 10.000002055723764
; 12 root of 1000000000000 = 9.999997305167618
; 13 root of 10000000000000 = 9.999996679539375
; 14 root of 100000000000000 = 10.000003750702039
; 15 root of 1000000000000000 = 9.999995393720468
; 16 root of 10000000000000000 = ?
; 
; > (test 10 4)
; 1 root of 10 = 10.0
; 2 root of 100 = 10.000063839877555
; 3 root of 1000 = 10.00003954119611
; 4 root of 10000 = 10.000025629525448
; 5 root of 100000 = 10.000016495205585
; 6 root of 1000000 = 10.000016276236842
; 7 root of 10000000 = 10.000008814859914
; 8 root of 100000000 = 10.000008599073222
; 9 root of 1000000000 = 10.000007232501645
; 10 root of 10000000000 = 10.000003749133414
; 11 root of 100000000000 = 10.00000245443361
; 12 root of 1000000000000 = 10.000002097806984
; 13 root of 10000000000000 = 10.00000045967737
; 14 root of 100000000000000 = 10.000000523124697
; 15 root of 1000000000000000 = 10.000000044531538
; 16 root of 10000000000000000 = 10.0
; 17 root of 100000000000000000 = 10.000000267190522
; 18 root of 1000000000000000000 = 9.999999403969111
; 19 root of 10000000000000000000 = 10.000001197980366
; 20 root of 100000000000000000000 = 10.000000676357345
; 21 root of 1000000000000000000000 = 9.999998553269666
; 22 root of 10000000000000000000000 = 10.000001296800935
; 23 root of 100000000000000000000000 = 9.999998214782478
; 24 root of 1000000000000000000000000 = 9.999996818426945
; 25 root of 10000000000000000000000000 = 10.00000247092737
; 26 root of 100000000000000000000000000 = 10.000002699910294
; 27 root of 1000000000000000000000000000 = 10.000003236824533
; 28 root of 10000000000000000000000000000 = 9.999996002243789
; 29 root of 100000000000000000000000000000 = 9.999995602296657
; 30 root of 1000000000000000000000000000000 = 9.999995488847638
; 31 root of 10000000000000000000000000000000 = 10.000004737220458
; 32 root of 100000000000000000000000000000000 = ?

; As we can see, given n damps, we can compute up to the (2^(n+1) - 1)th root.
; This works for other bases too, even for numbers, where the roots aren't
; exact.
;
; Some higher roots can be computed using fewer damps than the result we
; came up, for example 7th and 8th roots can be computed using just one average
; damp. Our result shows the worst case (max damps) needed to compute any given
; root.
; 
; Now we can calculate the maximum base for a given number of damps, but we need
; to do the opposite - given a base, calculate the maximal needed damps. We can
; see the number of needed damps increases with every power of 2. For example at
; 16 (2^4) the number of damps increases from 3 to 4.
; 
; To get the corresponding power of 2, for any root of degree d, we can
; calculate the base2 log of r. We disregard any decimal digits, because the
; damps increase precisely at powers of 2.
; 
; The required number of damps is therefore floor(log2(d)). We can get the
; integer part of a number by doing integer division by 1 or using the builtin
; floor procedure.

(define (root x degree)
  (define damps (floor (log degree 2)))
  (fixed-point
   ((repeated average-damp damps)
    (lambda (y) (/ x (expt y (- degree 1)))))
   x))

; (root 100000 5) ;9.999999309785903
; (root 1024 10)  ;1.9999984393767465
