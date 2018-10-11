#lang sicp

; Exercise 2.15:
; ==============
; Eva Lu Ator, another user, has also noticed the different intervals computed
; by different but algebraically equivalent expressions. She says that a formula
; to compute with intervals using Alyssa’s system will produce tighter error
; bounds if it can be written in such a form, that no variable that represents
; an uncertain number is repeated. Thus, she says, par2 is a “better” program
; for parallel resistances than par1. Is she right? Why?



; The problem here is, that dividing A/A should always be 1 and should have zero
; width. If A is any number in a given interval, then if we divide it by A it
; will always be 1, regardless to the width of the interval (because A always
; represents the same one particular measurement).
;
; But if we compare this to two different measurements A and B, although they
; might have the same center and width, their concrete values may be different.
; Because of that we cannot say that A/B will always be 1.
;
; In our computations, we treat all intervals as if they represented different
; measurements. This means, that if the same value appears multiple times in a
; formula, we can get a wrong (less accurate) answer. Eva is right.


