#lang typed/racket

(: label-number (String Number -> String))
(define label-number
  (lambda (label num)
    (string-append label ": " (number->string num))))

(: x-pos (Number -> String))
(define x-pos 
  (lambda (x-pos)
    (label-number "X Pos" x-pos)))

(: y-pos (Number -> String))
(define y-pos
  (lambda (y-pos)
    (label-number "Y Pos" y-pos)))

(: width (Number -> String))
(define width
  (lambda (width)
    (label-number "width" width)))

(: height (Number -> String))
(define height
  (lambda (height)
    (label-number "height" height)))

(: row-pos (Number -> String))
(define row-pos
  (lambda (row-pos)
    (label-number "Row Pos" row-pos)))

(: row-height (Real -> String))
(define row-height
  (lambda (row-height)
    (label-number "Row Height" (floor row-height))))

(: col-pos (Number -> String))
(define col-pos
  (lambda (col-pos)
    (label-number "Col Pos" col-pos)))

(: col-width (Real -> String))
(define col-width
  (lambda (col-width)
    (label-number "Col Width" (floor col-width))))

(: left (Real -> String))
(define left
  (lambda (left)
    (label-number "Left" (floor left))))

(: right (Real -> String))
(define right
  (lambda (right)
    (label-number "Right" (floor right))))

(: top (Real -> String))
(define top
  (lambda (top)
    (label-number "Top" (floor top))))

(: bottom (Real -> String))
(define bottom
  (lambda (bottom)
    (label-number "Bottom" (floor bottom))))

(: num-rows (Number -> String))
(define num-rows
  (lambda (num-rows)
    (label-number "Num Rows" num-rows)))

(: num-cols (Number -> String))
(define num-cols
  (lambda (num-cols)
    (label-number "Num cols" num-cols)))

(provide (all-defined-out))