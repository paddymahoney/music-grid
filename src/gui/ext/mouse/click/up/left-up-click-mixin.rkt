#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "up-click-interface.rkt"))
(require (prefix-in left: "left-up-click-interface.rkt"))

(define left-up-click-mixin
  (mixin (click:up-click<%>) (left:left-up-click<%>)
    
    (super-new)
   
    (define/override (on-up-click up-click-type x-pos y-pos) 
      (match up-click-type 
        ['left-up 
                  (on-left-up-click x-pos y-pos)]
        
        [_ (super on-up-click up-click-type x-pos y-pos)]))
    
    
    (define/public (on-left-up-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
