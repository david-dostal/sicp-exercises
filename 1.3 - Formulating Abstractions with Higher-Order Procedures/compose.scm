#lang sicp
(#%provide compose)

; Compose:
; ========

(define (compose f g)
  (lambda (x) (f (g x))))