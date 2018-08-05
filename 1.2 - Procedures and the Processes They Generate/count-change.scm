#lang sicp
(#%provide (all-defined))

; Counting change:
; ================

(define (count-change amt)
  (define (cc amt max-coin)
    (cond ((< amt 0) 0)      ; no way to get an amount < 0
          ((< max-coin 0) 0) ; no coins left
          ((= amt 0) 1)      ; zero coins = amt 0 (1 way)
          (else (+
                 ; choose coin and count ways to arrange the rest
                 (cc (- amt (coins max-coin)) max-coin)
                 ; or we can try a different coin with the initial amount
                 (cc amt (- max-coin 1))))))
  (cc amt 4))

(define (coins n)
  (cond ((= n 0) 1)
        ((= n 1) 5)
        ((= n 2) 10)
        ((= n 3) 25)
        (else 50)))