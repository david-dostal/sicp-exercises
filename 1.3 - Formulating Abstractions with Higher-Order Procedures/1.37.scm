#lang sicp

; Exercise 1.37:
; ==============
; a. An infinite continued fraction is an expression of the form
; f = N1 / (D1 + N2 / (D2 + N3 / (D3 + ...))). As an example, one can show that
; the infinite continued fraction expansion with the Ni and the Di all equal to
; 1 produces 1/φ, where φ is the golden ratio (described in Section 1.2.2).
; 
; One way to approximate an infinite continued fraction is to truncate the
; expansion aer a given number of terms. Such a truncation — a so-called k-term
; finite continued fraction — has the form
; N1 / (D1 + N2 / (... + Nk/Dk)).
;
; Suppose that n and d are procedures of one argument (the term index i) that
; return the Ni and Di of the terms of the continued fraction.
;
; Define a procedure cont-frac such that evaluating (cont-frac n d k) computes
; the value of the k-term finite continued fraction. Check your procedure by
; approximating 1/φ using
; 
; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)
;
; for successive values of k. How large must you make k in order to get an
; approximation that is accurate to 4 decimal places?
;
; b. If your cont-frac procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.



; a. Recursive solution

(define (cont-frac n d k)
  (define (recurse i)
    (if (<= i k)
        (/ (n i)
           (+ (d i) (recurse (+ i 1))))
        0))
  (recurse 1))

(define (ni k) 1.0)
(define (di k) 1.0)
(define (1-over-phi k)
  (cont-frac ni di k))

; should be approx. 0.6180
(1-over-phi 1)  ;1.0
(1-over-phi 2)  ;0.5
(1-over-phi 3)  ;0.6666666666666666
(1-over-phi 4)  ;0.6000000000000001
(1-over-phi 5)  ;0.625
(1-over-phi 6)  ;0.6153846153846154
(1-over-phi 7)  ;0.6190476190476191
(1-over-phi 8)  ;0.6176470588235294
(1-over-phi 9)  ;0.6181818181818182
(1-over-phi 10) ;0.6179775280898876
(1-over-phi 11) ;0.6180555555555556
(newline)

; To get an approximation accurate to 4 decimal places, k must be at least 11.


; b. Iterative solution

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (> i 0)
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))
        result))
  (iter k 0))

(cont-frac-iter ni di 11) ;0.6180555555555556
