#lang sicp

; Exercise 2.28:
; ==============
; Write a procedure fringe that takes as argument a tree (represented as a list)
; and returns a list whose elements are all the leaves of the tree arranged in
; left-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))

; (fringe x)
; (1 2 3 4)

; (fringe (list x x))
; (1 2 3 4 1 2 3 4)




(define (flatten list)
  (cond ((null? list) list)
        ((pair? (car list))
         (append (car list) (flatten (cdr list))))
        (else (cons (car list) (flatten (cdr list))))))

(define (map-rec fn list)
  (define (recurse list)
    (if (pair? list)
        (fn (map recurse list))
        list))
  (recurse list))

(define (fringe list) (map-rec flatten list))


(display (fringe x))
;(1 2 3 4)
(newline)

(display (fringe (list x x)))
;(1 2 3 4 1 2 3 4)
(newline)


(define (flatten-2 list)
  (define (iter list result)
    (cond ((null? list) result)
          ((pair? (car list))
           (iter (cdr list) (append result (car list))))
          (else (iter (cdr list) (cons (car list) result)))))
  (iter list nil))

(define (fringe-2 item)
  (cond ((null? item) item)
        ; append two lists and recursively fringe them if necessary
        ((pair? item) (append (fringe-2 (car item)) (fringe-2 (cdr item))))
        ; if item is not a list, make it a list
        (else (list item))))

(display (fringe-2 x))
;(1 2 3 4)
(newline)

(display (fringe-2 (list x x)))
;(1 2 3 4 1 2 3 4)
(newline)
