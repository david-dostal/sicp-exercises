#lang sicp

; Exercise 2.43:
; ==============
; Louis Reasoner is having a terrible time doing Exercise 2.42. His queens
; procedure seems to work, but it runs extremely slowly. (Louis never does
; manage to wait long enough for it to solve even the 6x6 case.)
; When Louis asks Eva Lu Ator for help, she points out that he has interchanged
; the order of the nested mappings in the flatmap, writing it as

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

; Explain why this interchange makes the program run slowly. Estimate how long
; it will take Louis’s program to solve the eight-queens puzzle, assuming that
; the program in Exercise 2.42 solves the puzzle in time T.




; For comparison, here is how the original code looks:

(flatmap
 (lambda (rest-of-queens)
   (map (lambda (new-row)
          (adjoin-position new-row k rest-of-queens))
        (enumerate-interval 1 board-size)))
 (queen-cols (- k 1)))

; In Louises version of the program, queen-cols gets called for every item in
; enumerate-interval (which in his case is 6 times). The problem here is that
; queen-cols is a recursive call, which means each of the originally 6 calls
; causes 6 more calls, each of those 36 calls cause 6 more calls and so on.
;
; In contrast the original version has only one recursive call for each "branch"
; of the recursive call tree.
;
; To answer the second question, the original code performs a linear amount O(n)
; of recursive calls with respect to the board size n, whereas Louises version
; needs O(n^n) calls (branching factor of n and tree deph of n).
; 
; Assuming the eight-queens puzzle takes the original program time T to perform
; 8 recursive calls, then Louises version would need a time
; T * (8^8 / 8) = T * 8^7, which is approxumately 2 million times as long.
