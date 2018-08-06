#lang sicp
(#%provide (all-defined))

; Recursive exponent:
; ===================

(define (expt b n)
  (if (= n 0) 1
      (* b (expt b (- n 1)))))


; Iterative exponent:
; ===================

(define (expti b n)
  (define (iter b n x)
    (if (= n 0) x
        (iter b (- n 1) (* x b))))
  (iter b n 1))


; Fast recursive exponent:
; ========================

(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (my-fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (my-fast-expt (* b b) (/ n 2)))
        (else (* b (my-fast-expt b (- n 1))))))