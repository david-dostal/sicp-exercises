#lang sicp
(#%require "2.07.scm")
(#%require "2.08.scm")
(#%require "2.12.scm")
(#%require "print-interval.scm")

; After considerable work, Alyssa P. Hacker delivers her finished system.
; Several years later, after she has forgotten all about it, she gets a frenzied
; call from an irate user, Lem E. Tweakit. It seems that Lem has noticed that
; the formula for parallel resistors can be written in two algebraically
; equivalent ways:
; R1*R2 / (R1+R2) and 1 / (1/R1 + 1/R2).
; He has written the following two programs, each of which computes the
; parallel-resistors formula differently:

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Lem complains that Alyssa’s program gives different answers for the two ways
; of computing. This is a serious complaint.

; Exercise 2.14:
; ==============
; Demonstrate that Lem is right. Investigate the behavior of the system on a
; variety of arithmetic expressions. Make some intervals A and B, and use them
; in computing the expressions A/A and A/B. You will get the most insight by
; using intervals whose width is a small percentage of the center value. Examine
; the results of the computation in center-percent form(see Ex. 2.12).




(print-interval (par1 (make-interval 1.0 2.0)
                      (make-interval 3.0 4.0))) ;(0.5, 2.0)
(print-interval (par2 (make-interval 1.0 2.0)
                      (make-interval 3.0 4.0))) ;(0.75, 1.3333333333333333)

; The results are indeed different and Lem is right. Let's investigate further.
(newline)

(define (test-quotient c1 p1 c2 p2)
  (print-center-percent
   (div-interval (make-center-percent c1 p1)
                 (make-center-percent c2 p2))))

; A/A:

(test-quotient 100 5 100 5)
;(1.0050125313283207, 9.97506234413964)

(test-quotient 100 1 100 1)
;(1.0002000200020003, 1.9998000199980077)

(test-quotient 80 1 80 1)
;(1.0002000200020003, 1.9998000199979908)

(test-quotient 80 30 80 30)
;(1.1978021978021978, 55.04587155963302)

; The center of A/A is approximately 1. The percentages approximately add up if
; they are small relative to the center values, else the result is smaller than
; their sum and the center isn't so accurate anymore.
(newline)

; A/B:

(test-quotient 100 1 40 1)
;(2.5005000500050008, 1.999800019998003)

(test-quotient 30 1 20 1)
;(1.5003000300030003, 1.9998000199980004)

(test-quotient 30 3 20 2)
;(1.501500600240096, 4.997001798920629)

(test-quotient 30 30 20 20)
;(1.65625, 47.16981132075472)

; If we are dividing two different intervals, the same holds true, for small
; tolerances the center is approximately equal to the ratio of both intervals.
; If the percentages get bigger, this stops being true.
