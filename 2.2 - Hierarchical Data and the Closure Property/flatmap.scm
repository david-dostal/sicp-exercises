#lang sicp
(#%require "accumulate.scm")
(#%provide flatmap)

; Flatmap
; =======

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))