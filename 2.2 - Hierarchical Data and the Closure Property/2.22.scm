#lang sicp
(#%require "square.scm")

; Exercise 2.22:
; ==============
; Louis Reasoner tries to rewrite the first square-list procedure of Exercise
; 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Unfortunately, defining square-list this way produces the answer list in the
; reverse order of the one desired. Why?
;
; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; This doesn’t work either. Explain.




; The reason the first square-list procedure produces the list in reverse order
; is, that when iteratively constructing answer, each time we prepend the value
; to the current answer. The last item gets prepended last, so it is the first
; in the list and so on.
;
; The problem with the second procedure is that by reversing the order, the
; first argument to cons becomes a list and the second argument is the value.
; This leads to the pairs being nested in the wrong order:
; (((((nil 1) 2) 3) 4) 5)
; 
; instead of the correct
; (1 (2 (3 (4 (5 nil)))))
;
; Although we could in theory store lists in this way too, it is inconsistent
; with the common way of thinking about lists. car would return a list instead
; of the first item and cdr would return a single value instead of the rest of
; the list.
