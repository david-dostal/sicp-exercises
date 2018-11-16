#lang sicp

; Exercise 2.47:
; ==============
; Here are two possible constructors for frames:
; 
; (define (make-frame origin edge1 edge2)
;   (list origin edge1 edge2))

; (define (make-frame origin edge1 edge2)
;   (cons origin (cons edge1 edge2)))
; 
; For each constructor supply the appropriate selectors to produce an
; implementation for frames.




; Frame constructors
(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))


; Selectors for constructor 1
(define (origin-1 f)
  (car f))

(define (edge1-1 f)
  (cadr f))

(define (edge2-1 f)
  (caddr f))


; Selectors for constructor 2
(define (origin-2 f)
  (car f))

(define (edge1-2 f)
  (cadr f))

(define (edge2-2 f)
  (cddr f))


; Example usage
(define f1 (make-frame-1 1 2 3))
(origin-1 f1) ;1
(edge1-1 f1) ;2
(edge2-1 f1) ;3
(newline)

(define f2 (make-frame-2 1 2 3))
(origin-2 f2) ;1
(edge1-2 f2) ;2
(edge2-2 f2) ;3
