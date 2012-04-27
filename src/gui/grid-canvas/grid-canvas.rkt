#lang racket

(require "../../lang/define-property.rkt")
(require (prefix-in lbl: "info-labels.rkt"))
(require (prefix-in info: "info-updaters.rkt"))
(require (prefix-in calc: "grid-calculations.rkt"))
(require (prefix-in draw: "grid-drawing.rkt"))
(require (prefix-in dc: "../ext/dc-utils.rkt"))
(require (prefix-in canvas: "../ext/canvas++.rkt"))


(define grid-canvas%
  (class canvas:canvas++%
    (inherit get-dc get-width get-height)
    (super-new)
    (init [init-num-rows num-rows] [init-num-cols num-cols] [init-x-pos 0] [init-y-pos 0]  [init-height 200] [init-width 200])
    
    (define-property num-rows init-num-rows)
    (define-property num-cols init-num-cols)
    
    (define-property x-pos init-x-pos)
    (define-property y-pos init-y-pos)
    
    (define-property row-height (calc:calc-row-height (get-height) num-rows))
    (define-property col-width (calc:calc-col-width (get-width) num-cols))
    
    (define-property row-pos (calc:calc-row-pos (get-y-pos) (get-row-height)))
    (define-property col-pos (calc:calc-col-pos (get-x-pos) (get-col-width)))
    
    (define-property left (calc:calc-left (get-col-pos) (get-col-width)))
    (define-property right (calc:calc-right (get-col-pos) (get-col-width)))
    
    (define-property top (calc:calc-top (get-row-pos) (get-row-height)))
    (define-property bottom (calc:calc-bottom (get-row-pos) (get-row-height)))
    
    (define update-fields-on-mouse-move
      (lambda (x-pos y-pos)
        (set-x-pos x-pos)
        (set-y-pos y-pos)
        (update-mouse-pos-dependencies x-pos y-pos)))
    
    (define update-mouse-pos-dependencies
      (lambda (x-pos y-pos)
        (set-row-pos (calc:calc-row-pos  (get-y-pos) (get-row-height)))
        (set-col-pos (calc:calc-col-pos  (get-x-pos) (get-col-width)))
        (set-left (calc:calc-left (get-col-pos) (get-col-width)))
        (set-right (calc:calc-right (get-col-pos) (get-col-width)))
        (set-top (calc:calc-top (get-row-pos) (get-row-height)))
        (set-bottom (calc:calc-right (get-row-pos) (get-row-height)))))
    
    (define update-fields-on-size
      (lambda (width height)
        (set-row-height (calc:calc-row-height (get-height) (get-num-rows)))
        (set-col-width (calc:calc-col-width (get-width) (get-num-cols)))
        (set-row-pos (calc:calc-row-pos (get-y-pos) (get-row-height)))
        (set-col-pos (calc:calc-col-pos (get-x-pos) (get-col-width)))
        (set-left (calc:calc-left (get-col-pos) (get-col-width)))
        (set-right (calc:calc-right (get-col-pos) (get-col-width)))
        (set-top (calc:calc-top (get-row-pos) (get-row-height)))
        (set-bottom (calc:calc-right (get-row-pos) (get-row-height)))))
    
    (info:update-on-init 
     (get-num-rows)
     (get-num-cols)
     (get-width)
     (get-height)
     (get-row-height)
     (get-col-width)
     (get-x-pos)
     (get-y-pos)
     (get-row-pos)
     (get-col-pos)
     (get-left)
     (get-right)
     (get-top)
     (get-bottom))
    
    (define/override (on-mouse-move x-pos y-pos)  
      (update-fields-on-mouse-move x-pos y-pos)
      (info:update-on-mouse-move 
       (get-x-pos) 
       (get-y-pos) 
       (get-row-pos) 
       (get-col-pos)
       (get-left) 
       (get-right) 
       (get-top) 
       (get-bottom))
      (super on-mouse-move x-pos y-pos)
      )
    
    (define/override (on-size width height)
      (update-fields-on-size width height)
      (info:update-on-size
       (get-width)
       (get-height)
       (get-row-height)
       (get-col-width)
       (get-x-pos)
       (get-y-pos)
       (get-row-pos)
       (get-col-pos)
       (get-left)
       (get-right)
       (get-top)
       (get-bottom))
      (super on-size width height))))
  
  
  
  (provide (all-defined-out))
  
  