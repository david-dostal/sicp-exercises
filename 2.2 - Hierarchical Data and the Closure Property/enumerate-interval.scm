#lang sicp
(#%provide enumerate-interval)

; Enumerate interval
; ==================

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
