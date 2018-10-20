#lang sicp
(#%require "accumulate.scm")

; Exercise 2.37:
; ==============
; Suppose we represent vectors v = (v_i) as sequences of numbers, and matrices
; m = (m_ij ) as sequences of vectors (the rows of the matrix). For example, the
; matrix
; 
; /1 2 3 4\
; |4 5 6 6|
; \6 7 8 9/
; 
; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With this
; representation, we can use sequence operations to concisely express the basic
; matrix and vector operations. These operations (which are described in any
; book on matrix algebra) are the following:
; 
; (dot-product v w) returns the sum SUM_i(v_i * w_i)
; (matrix-*-vector m v) returns the vector t, where t_i = SUM_j(m_ij * v_j)
; (matrix-*-matrix m n) returns the matrix p, where p_ij = SUM_k(m_ik * n_kj)
; (transpose m) returns the matrix n, where n_ij = m_ji
;
; We can define the dot product as

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following procedures for computing the
; other matrix operations. (The procedure accumulate-n is defined in Exercise
; 2.36.)

; (define (matrix-*-vector m v)
;   (map <??> m))

; (define (transpose mat)
;   (accumulate-n <??> <??> mat))

; (define (matrix-*-matrix m n)
;   (let ((cols (transpose n)))
;     (map <??> m)))




; # Testing data

(define v (list 1 2 2 3))
(define w (list 1 1 3 4))
(define m  (list (list 1 2 3 4)
                 (list 4 5 6 6)
                 (list 6 7 8 9)))
(define n (list (list 1 1)
                (list 2 3)
                (list 1 1)
                (list 1 2)))

(display (dot-product v w))
;21
(newline)


; # Matrix * vector

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(display (matrix-*-vector m v))
;(23 44 63)
(newline)


; # Transpose

(define (transpose mat)
  (accumulate-n cons nil mat))

(display (transpose m))
;((1 4 6) (2 5 7) (3 6 8) (4 6 9))
(newline)


; # Matrix * matrix

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(display (matrix-*-matrix m n))
;((12 18) (26 37) (37 53))
(newline)
