#lang sicp
(#%provide cont-frac)

; K-term continued fraction:
; =========================

(define (cont-frac n d k)
  (define (iter i result)
    (if (> i 0)
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))
        result))
  (iter k 0))