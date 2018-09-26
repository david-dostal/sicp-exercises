#lang sicp
(#%require "2.07.scm")
(#%require "2.08.scm")
(#%require "2.12.scm")

; Exercise 2.13:
; ==============
; Show that under the assumption of small percentage tolerances there is a
; simple formula for the approximate percentage tolerance of the product of two
; intervals in terms of the tolerances of the factors. You may simplify the
; problem by assuming that all numbers are positive.



; First, let's do some experiments:
(define (test ci pi cj pj)
 (percent (mul-interval (make-center-percent ci pi)
                       (make-center-percent cj pj))))

(test 10 1 8 2)     ;2.9994001199760034
(test 1054 1 234 2) ;2.9994001199759994
(test 23 3 21 1)    ;3.998800359892043
(test 12 5 12 8)    ;12.94820717131474
(test 12 20 87 40)  ;55.55555555555556

; From the experiments is looks like the percentage of a product is
; approximately the sum of the percentages of the terms. For larger percentages
; the results are less accurate.
;
; Let's try to show, why this is true:
;
; Consider two intervals, i[a; b] and j[c; d] and their product k = i * j.
; Assuming all numbers are positive, the bounds of the product are k[ac; bd].
;
; The tolerance of an interval x[a; b] can be calculated by a simple formula:
; 
; percent(x) =
; width(x) / center(x) =
; (b-a)/2 / (a+b)/2 =
; (b-a) / (a+b)
;
; Similarly, we can calculate the tolerance for i, j and k:
;
; percent(i) = (b-a) / (a+b)
; percent(j) = (d-c) / (c+d)
; percent(i*j) = (bd-ac) / (ac+bd)
;
; Our assumption is, that for small percentage tolerances, the tolerance of i*j
; is approximately equal to percent(i) + percent(j):
;
; percent(i*j) ≈
; (b-a)/(a+b) + (d-c)/(c+d) ≈
; (b-a)(c+d)+(a+b)(d-c) / (ac+ad+bc+bd) ≈
; (bc + bd - ac - ad + ad - ac + bd - bc) / (ac + ad + bc + bd) ≈
; 2*(bd-ac) / (ac+ad+bc+bd)
;
; Because the tolerances are fairly small, we consider ac+bd and ad+bc be
; approximately the same (proof comes later). So we can conclude:
;
; 2*(bd-ac) / (ac+ad+bc+bd) ≈
; 2*(bd-ac) / 2*(ac+bd) ≈
; (bd-ac) / (ac+bd)
;
; This shows, that if the percentage tolerances are small enough, our
; approximation is very close to the exact answer.
;
; Now for those, who want a better explanation of why ac+bd and ad+bc are
; approximately the same:
;
; We can express i and j as their lower interval and some difference:
; i = [a; a+δ] and j = [c; c+ε].
; ac+bd = ac + (a+δ)(c+ε) = ac+ac+aδ+δc+δε = 2ac+aε+δc+δε
; ad+bc = a(c+ε) + (a+δ)c = ac+aε+ac+δc = 2ac+aε+δc
;
; The only difference is δε, which are (relative to the other numbers) two verry
; small numbers multiplied by each other, which makes them almost insignificant
; if they are small enough.


