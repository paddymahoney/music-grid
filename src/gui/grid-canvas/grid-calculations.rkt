#lang typed/racket

#|Grid calculation functions.|#

(: calc-row-pos (Nonnegative-Integer Real -> Number))
(define calc-row-pos
  (lambda (y-pos row-height)   
    (floor (/ y-pos row-height))))

(: calc-col-pos (Nonnegative-Integer Real -> Number))
(define calc-col-pos
  (lambda (x-pos col-width)   
    (floor (/ x-pos col-width))))

(: calc-left (Nonnegative-Integer Real -> Number))
(define calc-left
  (lambda (col-pos col-width)
    (* col-pos col-width)))

(: calc-right (Nonnegative-Integer Real -> Number))
(define calc-right
  (lambda (col-pos col-width)
    (+ (- col-width 1) (* col-pos col-width))))

(: calc-top (Nonnegative-Integer Real -> Number))
(define calc-top
  (lambda (row-pos row-height)
    (* row-pos row-height)))

(: calc-bottom (Nonnegative-Integer Real -> Number))
(define calc-bottom
  (lambda (row-pos row-height)
    (+ (- row-height 1) (* row-pos row-height))))

(: calc-row-height (Nonnegative-Integer Nonnegative-Integer -> Number))
(define calc-row-height
  (lambda (height num-rows)
    (/ height num-rows)))

(: calc-col-width (Nonnegative-Integer Nonnegative-Integer -> Number))
(define calc-col-width 
  (lambda (width num-cols)
    (/ width num-cols)))

(provide (all-defined-out))