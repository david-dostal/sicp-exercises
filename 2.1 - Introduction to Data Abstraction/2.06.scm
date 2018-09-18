#lang sicp

; Exercise 2.06:
; ==============
; In case representing pairs as procedures wasn’t mindboggling enough, consider
; that, in a language that can manipulate procedures, we can get by without
; numbers (at least insofar as nonnegative integers are concerned) by
; implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo
; Church, the logician who invented the λ-calculus.
; 
; Define one and two directly (not in terms of zero and add-1). (Hint: Use
; substitution to evaluate (add-1 zero)). Give a direct definition of the
; addition procedure + (not in terms of repeated application of add-1).



; Let's try to wrap our heads around this. Notice, that both procedures return
; a lambda taking a function f, which in turn returns another lambda. Zero,
; given any function f returns a lambda x -> x. add-1, given any function f,
; returns a lambda x -> f(n(f)(x)).
;
; What happens, if we apply add-1 to zero?
(add-1 zero)

; n gets substituted for zero:
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))

; f is ignored by zero:
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))

; applying x to the identity function gives us x
(lambda (f) (lambda (x) (f x)))

; The result is a procedure, which given a function f returns a lambda
; x -> f(x). Now we know, what one looks like.

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

; Zero, given a function f, returns a lambda x -> x (applies f 0-times),
; one x -> f(x) (applies x to f once). If we would call add-1 one more
; time, we would get x -> f(f(x)):

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

; Any church numeral n, given a function f, repeatedly applies the function f,
; n-times in total: f(f(f(f...n-times...(f x)))). For example, three would be
; encoded as f(f(f(x))).
; To combine two procedures so they 'add' 2 numbers m and, all we have to do is
; apply f (m + n) times. In other words, first we apply f n-times and then
; m-times. Any Church numeral itself already is a procedure, which repeatedly
; applies f, so this is pretty simple. Given a function f, we return a lambda
; x -> m(f)(n(f)(x)).

(define (add m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

; To print a Church numeral, all we have to do is start with x at zero and
; repeatedly apply add1:

(define (print n)
  (define (add1 x) (+ 1 x))
  ((n add1) 0))

(print zero) ;0
(print one) ;1
(print (add one one)) ;2
(print (add one two)) ;3
(print (add two two)) ;4
(print (add two (add two one))) ;5
