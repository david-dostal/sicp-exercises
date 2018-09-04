#lang sicp
(#%require "fixed-point.scm")

; Exercise 1.35:
; ==============
; Show that the golden ratio φ (Section 1.2.2) is a fixed point of the
; transformation x -> 1 + 1/x, and use this fact to compute ϕ by means of the
; fixed-point procedure.



; The golden ratio is defined as a number φ, that satisfies the equation
; φ^2 = φ + 1. If we divide both sides by φ, we get φ = 1 + 1 / φ. Now we can
; repeatedly substitute φ on the right side:

; φ = 1 + 1 / φ
; φ = 1 + 1 / (1 + 1 / φ)
; φ = 1 + 1 / (1 + 1 / (1 + 1 / φ))
; φ = 1 + 1 / (1 + 1 / (1 + 1 / (1 + ...)))

; We can use the fixed-point procedure to calculate approximations of φ, because
; this is just a repeated transformation of φ -> 1 + 1 / φ:

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;1.6180327868852458