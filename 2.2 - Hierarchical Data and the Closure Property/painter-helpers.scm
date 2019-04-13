#lang sicp
(#%require sicp-pict)
(#%provide (all-defined))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (combine p1 p2)
  (lambda (frame)
    (p1 frame)
    (p2 frame)))