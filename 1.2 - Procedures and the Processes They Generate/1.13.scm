#lang sicp

; Exercise 1.13:
; ==============
; Prove that Fib(n) is the closest integer to (Φ^n)/√5, where Φ = (1 + √5)/2.
; Hint: Let Ψ = (1 - √5)/2. Use induction and the definition of the Fibonacci
; numbers (see Section 1.2.2) to prove that Fib(n) = (ϕ^n - Ψ^n)/√5.


; What does it even mean that Fib(n) is the closest integer to (Φ^n)/√5? How can
; we mathematically describe a closest integer to x?
; If i is the closest integer to x it means the difference between i and x has
; to be smaller than 0.5, otherwise the closest integer would be another number.
; 
; That means we need to prove that | (Φ^n)/√5 - Fib(n) | < 1/2.
; Now let's assume the claim in the hint holds true (we will prove it ourselves
; later).
; Assuming Fib(n) = (φ^n - Ψ^n)/√5 we can construct the proof:
; 
;    | (Φ^n)/√5 - (φ^n - Ψ^n)/√5 | < 1/2.
;
; | (Φ^n)/√5 - (Φ^n)/√5 + Ψ^n/√5 | < 1/2
;                       | Ψ^n/√5 | < 1/2
;          | ((1 - √5)/2)^n / √5 | < 1/2
 ;            | (1 - √5)^n / 2^n | < √5 / 2
;               2 * | (1 - √5)^n | < √5 * 2^n
;
; We can see that 2 < √5 and |(1 - √5)| < 2, thus the left side must be smaller,
; which was to be proven.


; All we need to prove now is the statement from the hint (using induction):
; 
; Fib(n) = (φ^n - Ψ^n)/√5
; 
; 1)
; Fib(1) = (ϕ - Ψ)/√5
;
; 1 = ((1 + √5)/2 - (1 - √5)/2) / √5
; 1 = (1 + √5 - 1 + √5) / 2√5
; 1 = 2√5 / 2√5
; 1 = 1
; 
; As we can see, the claim is true for n=1. We can easily prove this for n=2:
; 
; Fib(2) = (φ^2 - Ψ^2)/√5
; Fib(2) = ((1 + √5)^2 - (1 - √5)^2) / 4√5
; Fib(2) = (1 + 2√5 + 5 - 1 + 2√5 - 5) / 4√5
; Fib(2) = 4√5 / 4√5 = 1
; 
; 2)
; Now, assuming
; Fib(n) = (φ^n - Ψ^n)/√5 and
; Fib(n+1) = (φ^(n+1) - Ψ^(n+1))/√5
; 
; 3)
; We want to prove that
; Fib(n+2) = (φ^(n+2) - Ψ^(n+2))/√5.
;
; Fib(n+1) + Fib(n) = (φ^(n+2) - Ψ^(n+2))/√5
; (φ^(n+1) - Ψ^(n+1))/√5 + (φ^n - Ψ^n)/√5 = (φ^(n+2) - Ψ^(n+2))/√5
; φ^(n+1) - Ψ^(n+1) + φ^n - Ψ^n = φ^(n+2) - Ψ^(n+2)
; φ*φ^n - Ψ*Ψ^n + φ^n - Ψ^n = φ*φ*φ^n - Ψ*Ψ*Ψ^n
; φ^n*(φ-1) - Ψ^n*(Ψ-1) = φ^n*(φ^2) - Ψ^n*(Ψ^2)
;
; Previously in the book it was mentioned, that φ is the golden ratio, which
; satisfies the equation φ^2 = φ + 1. It is also true, that Ψ^2 = Ψ + 1 (we
; won't prove it here).
; Knowing that, we can substitute φ^2 for φ + 1 and Ψ^2 for Ψ + 1:
; 
; φ^n*(φ-1) - Ψ^n*(Ψ-1) = φ^n*(φ-1) - Ψ^n*(Ψ-1)
;
; Thus the proof is finished. Q. E. D.