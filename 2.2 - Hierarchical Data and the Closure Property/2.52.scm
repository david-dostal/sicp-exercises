#lang sicp
(#%require sicp-pict)
(#%require "wave.scm")
(#%require "painter-helpers.scm")

; Exercise 2.52:
; ==============
; Make changes to the square limit of wave shown in Figure 2.9 by working at
; each of the levels described above. In particular:
; a. Add some segments to the primitive wave painter of Exercise 2.49 (to add a
;    smile, for example).
; b. Change the pattern constructed by corner-split (for example, by using only
;    one copy of the up-split and right-split images instead of two).
; c. Modify the version of square-limit that uses square-of-four so as to
;    assemble the corners in a different pattern. (For example, you might make
;    the big Mr. Rogers look outward from each corner of the square.)

; Modified wave painter
(define wave-smiling
  (combine
   wave
   (segments->painter
    (list (make-segment (make-vect 0.43 0.85) (make-vect 0.45 0.85))
          (make-segment (make-vect 0.57 0.85) (make-vect 0.55 0.85))
          (make-segment (make-vect 0.55 0.75) (make-vect 0.50 0.73))
          (make-segment (make-vect 0.45 0.75) (make-vect 0.50 0.73))))))

(paint wave-smiling)

; Modified corner-split
(define (corner-split painter n)
  (if (= n 0)
      painter
      (beside
       (below painter (up-split painter (- n 1)))
       (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))

(paint (corner-split einstein 3))

; Modified square-limit
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside quarter (flip-horiz quarter))))
      (below half (flip-vert half)))))

(paint (square-limit einstein 3))