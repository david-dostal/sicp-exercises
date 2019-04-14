#lang sicp

; Exercise 2.55:
; ==============
; Eva Lu Ator types to the interpreter the expression
; (car ''abracadabra)
; To her surprise, the interpreter prints back quote. Explain.



; ''abracadabra can be written as (quote (quote abracadabra)). This means the
; result of the outer quotation is '(quote abracadabra). The car (first element)
; of this list is the symbol "quote" - which on some systems can be displayed as
; just ' (in DrRacket the result is the symbol "quote", not a literal quote
; character).

(display ''abracadabra) ;'abracadabra
(newline)

(display (car ''abracadabra)) ;quote
(newline)

(display (cdr ''abracadabra)) ;(abracadabra)
(newline)
