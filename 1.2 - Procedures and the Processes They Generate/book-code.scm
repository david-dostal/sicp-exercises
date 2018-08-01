#lang sicp
(#%provide (all-defined))

; Code for chapter 1.2 - Procedures and processes they generate
; =============================================================


; # Factorial - recursion

(define (fact-rec n)
  (if (= n 1)
      1
      (* n (fact-rec (- n 1)))))


; # Factorial - iteration

(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))


; # Counting change

(define (count-iter amt max-coin)
  (cond ((< amt 0) 0)      ; no way to get an amount < 0
        ((< max-coin 0) 0) ; no coins left
        ((= amt 0) 1)      ; zero coins = amt 0 (1 way)
        (else (+
               ; choose coin and count ways to arrange the rest
               (count-iter (- amt (coins max-coin)) max-coin)
               ; or we can try a different coin with the initial amount
               (count-iter amt (- max-coin 1))))))

(define (coins n)
  (cond ((= n 0) 1)
        ((= n 1) 5)
        ((= n 2) 10)
        ((= n 3) 25)
        (else 50)))

(define (count-change amt) (count-iter amt 4))