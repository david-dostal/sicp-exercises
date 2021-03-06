#lang sicp

; Exercise 2.29:
; ==============
; A binary mobile consists of two branches, a left branch and a right branch.
; Each branch is a rod of a certain length, from which hangs either a weight or
; another binary mobile. We can represent a binary mobile using compound data by
; constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a
; structure, which may be either a number (representing a simple weight) or
; another mobile:

(define (make-branch length structure)
  (list length structure))


; a. Write the corresponding selectors left-branch and right-branch, which
; return the branches of a mobile, and branch-length and branch-structure, which
; return the components of a branch.
;
; b. Using your selectors, define a procedure total-weight that returns the
; total weight of a mobile.
;
; c. A mobile is said to be balanced if the torque applied by its topleft branch
; is equal to that applied by its top-right branch (that is, if the length of
; the left rod multiplied by the weight hanging from that rod is equal to the
; corresponding product for the right side) and if each of the submobiles
; hanging off its branches is balanced. Design a predicate that tests whether a
; binary mobile is balanced.
;
; d. Suppose we change the representation of mobiles so that the constructors
; are
; 
; (define (make-mobile left right)
;   (cons left right))
; 
; (define (make-branch length structure)
;   (cons length structure))
; 
; How much do you need to change your programs to convert to the new
; representation?





; a.
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))



; b.

; a few useful helper procedures
(define (leaf? mobile) (not (pair? mobile)))
(define (left-structure mobile)
  (branch-structure (left-branch mobile)))
(define (right-structure mobile)
  (branch-structure (right-branch mobile)))

; example mobile for testing purposes
(define test-mobile
  (make-mobile
   (make-branch 1 (make-mobile
                   (make-branch 1 2)
                   (make-branch 1 (make-mobile
                                   (make-branch 1 1)
                                   (make-branch 1 1)))))
   (make-branch 2 2)))

(define test-mobile-2
  (make-mobile
   (make-branch 1 (make-mobile
                   (make-branch 1 2)
                   (make-branch 1 (make-mobile
                                   (make-branch 1 2)
                                   (make-branch 1 1)))))
   (make-branch 2 2)))

; and finally our total-weight procedure
(define (total-weight mobile)
  (if (leaf? mobile)
      mobile
      (+ (total-weight (left-structure mobile))
         (total-weight (right-structure mobile)))))

(total-weight test-mobile)
;6
(total-weight test-mobile-2)
;7



; c.
(define (branch-torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (leaf? mobile)
      true
      (and (= (branch-torque (left-branch mobile))
              (branch-torque (right-branch mobile)))
           (balanced? (left-structure mobile))
           (balanced? (right-structure mobile)))))

(balanced? test-mobile)
;#t
(balanced? test-mobile-2)
;#f



; d.

; We would only have to redefine the left-branch, right-branch, branch-length
; and branch-structure procedures, because they hide the particular
; implementation of the data structures from other procedures using them.
; The changed procedures would look like this (left-branch and branch-length are
; in fact the same as before):

; (define (left-branch mobile) (car mobile))
; (define (right-branch mobile) (cdr mobile))

; (define (branch-length branch) (car branch))
; (define (branch-structure branch) (cdr branch))
