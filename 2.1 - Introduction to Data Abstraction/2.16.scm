#lang sicp

; Exercise 2.16:
; ==============
; Explain, in general, why equivalent algebraic expressions may lead to
; different answers. Can you devise an interval-arithmetic package that does not
; have this shortcoming, or is this task impossible? (Warning: This problem is
; very difficult.)



; We already partially answered this question in exercise 2.15. The problem is
; our interval arithmetic doesn't distinguish between multiple occurences of the
; same measurement and values representing different values.
;
; To remove this problem, we would have to introduce some form of distinguishing
; values representing the same measurement and considering that in our
; calculations.
;
; 
; Even then this still remains a hard problem. Ideally we would reduce the
; expression to a form containing a single variable only once. In fact, this is
; impossible to do in general:
;
; According to the Wikipedia article on Interval arithmetic:
; "In general, it can be shown that the exact range of values can be achieved,
;  if each variable appears only once and if f is continuous inside the box.
;  However, not every function can be rewritten this way."
;
; So this is probably not the path we want to take, although the first step we
; could do would be to rewrite our equations by hand to contain only single
; occurences of all variables, if possible.
;
; 
; Another possible way to solve this problem would be to check the results of
; the results of the expression for every possible combination of upper and
; lower bounds of our variables and then determine our overeall lowest and
; highest possible value.
;
; To do this, we could let the user separately enter the bounds of the different
; measurements and then write their expression using variables for these
; intervals. The program then would check the result for all different
; combinations of bounds and pick the lowest and highest result as the new
; bounds.
;
; This would of course become very computationally expensive with more
; than a few variables. (We would need to perform 2^n checks, where n is the
; number of different variables.) I will leave the implementation of this
; problem for another time.
