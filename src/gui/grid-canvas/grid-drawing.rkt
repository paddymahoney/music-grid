#lang racket

(require (prefix-in calc: "grid-calculations.rkt"))
(require (prefix-in dc: "../ext/dc-utils.rkt"))

#|Drawing functions
These draw the grid to the screen. |#
(define draw-grid
  (lambda (dc num-rows num-cols)
    (draw-outer-box dc)
    (draw-inner-lines dc num-rows num-cols)))

(define draw-outer-box
  (lambda (dc)
    (define width (dc:width dc))
    (define height (dc:height dc))
    
    #|These values need to be calculated here (and not earlier), or else they are stale by the time painting occurs, and the grid doesn't cover the entire device-context.|#
    
    #|Draws line across top.|# 
    (send dc draw-line 0 0 width 0) 
    #|Draws line across bottom|# 
    (send dc draw-line 0 height width height)
    #|Draws line across left side|#
    (send dc draw-line 0 0 0 height) 
    #|Draws line  across right side|#
    (send dc draw-line width 0 width height)))

(define draw-row-lines 
  (lambda (dc num-rows)
    (define width (dc:width dc))
    (define height (dc:height dc))
    
    (define row-height (calc:calc-row-height height num-rows))
    
    (for ([y (in-range 0 height row-height)])
      (send dc draw-line 0 y width y))))

(define draw-col-lines 
  (lambda (dc num-cols)
    (define width (dc:width dc))
    (define height (dc:height dc))
    
    (define col-width (calc:calc-col-width width num-cols))
    (for ([x (in-range 0 width col-width)])
      (send dc draw-line x 0 x height))))

(define draw-inner-lines
  (lambda (device-context num-rows num-cols)
    (draw-row-lines device-context num-rows)
    (draw-col-lines device-context num-cols)))

(define grid-painter
  (lambda (num-rows num-cols)
    (lambda (canvas device-context)
      (draw-grid device-context num-rows num-cols))))


(provide (all-defined-out))
