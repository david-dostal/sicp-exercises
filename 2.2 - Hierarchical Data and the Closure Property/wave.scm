#lang sicp
(#%require sicp-pict)
(#%provide wave)

(define wave
  (segments->painter
   (list (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
         (make-segment (make-vect 0.30 0.00) (make-vect 0.40 0.55))
         (make-segment (make-vect 0.40 0.55) (make-vect 0.15 0.40))
         (make-segment (make-vect 0.15 0.40) (make-vect 0.00 0.55))
         (make-segment (make-vect 0.00 0.65) (make-vect 0.20 0.55))
         (make-segment (make-vect 0.20 0.55) (make-vect 0.40 0.70))
         (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
         (make-segment (make-vect 0.35 0.85) (make-vect 0.45 1.00))

         (make-segment (make-vect 0.65 0.85) (make-vect 0.55 1.00))
         (make-segment (make-vect 0.60 0.70) (make-vect 0.65 0.85))
         (make-segment (make-vect 1.00 0.40) (make-vect 0.60 0.70))
         (make-segment (make-vect 0.60 0.55) (make-vect 1.00 0.30))
         (make-segment (make-vect 0.70 0.00) (make-vect 0.60 0.55))
         (make-segment (make-vect 0.60 0.00) (make-vect 0.50 0.30)))))