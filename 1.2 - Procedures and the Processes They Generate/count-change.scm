#lang sicp
(#%provide (all-defined))

; Counting change:
; ================

(define (count-change amt)
  (define (count-iter amt max-coin)
    (cond ((< amt 0) 0)      ; no way to get an amount < 0
          ((< max-coin 0) 0) ; no coins left
          ((= amt 0) 1)      ; zero coins = amt 0 (1 way)
          (else (+
                 ; choose coin and count ways to arrange the rest
                 (count-iter (- amt (coins max-coin)) max-coin)
                 ; or we can try a different coin with the initial amount
                 (count-iter amt (- max-coin 1))))))
  (count-iter amt 4))

(define (coins n)
  (cond ((= n 0) 1)
        ((= n 1) 5)
        ((= n 2) 10)
        ((= n 3) 25)
        (else 50)))