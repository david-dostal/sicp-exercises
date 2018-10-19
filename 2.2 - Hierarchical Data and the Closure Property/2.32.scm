#lang sicp

; Exercise 2.32:
; ==============
; We can represent a set as a list of distinct elements, and we can represent
; the set of all subsets of the set as a list of lists. For example, if the set
; is (1 2 3), then the set of all subsets is
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)).
; Complete the following definition of a procedure that generates the set of
; subsets of a set and give a clear explanation of why it works:
; 
; (define (subsets s)
;   (if (null? s)
;       (list nil)
;       (let ((rest (subsets (cdr s))))
;         (append rest (map <??> rest)))))


(define (add-to-set element) (lambda (set) (cons element set)))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (add-to-set (car s)) rest)))))

(display (subsets (list 1 2 3)))
;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))


; The subsets of an empty set () are obviously an empty set.
; If we have one element in the set, for example (1), the result still contains
; an empty set (), but now it also contains a set with that one element (1).
; If we added one more element to the set, for example (1 2), the result
; contains all the previous results (() (1)), plus all those results with a 2
; added to them ((2) (1 2)), resulting in (() (1) (2) (1 2)).
;
; The subsets procedure just recursively appends those sets.
; Given a set, it produces all possible subsets without the first element and
; appends to them all those possible subsets including the first element.
