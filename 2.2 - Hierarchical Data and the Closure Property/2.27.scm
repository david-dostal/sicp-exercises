#lang sicp

; Exercise 2.27:
; ==============
; Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse
; procedure that takes a list as argument and returns as its value the list with
; its elements reversed and with all sublists deep-reversed as well. For
; example,

(define x (list (list 1 2) (list 3 4)))
 
; x
; ((1 2) (3 4))
; 
; (reverse x)
; ((3 4) (1 2))
; 
; (deep-reverse x)
; ((4 3) (2 1))




(define (deep-reverse list)
  (define (recurse next)
    (if (pair? next) (deep-reverse next) next))
  
  (define (iter list reversed)
    (if (null? list)
        reversed
        (iter (cdr list)
              (cons (recurse (car list)) reversed))))
  (iter list nil))


(display (deep-reverse x))
;((4 3) (2 1))
(newline)


(define (deep-reverse-2 list)
  ; if it is a list
  (if (pair? list)
      ; reverse the list and deep-reverse each item in it
      (reverse (map deep-reverse-2 list))
       ; if it is not a list it is a leaf and doesn't need to be reversed
      list))

(display (deep-reverse-2 x))
;((4 3) (2 1))
