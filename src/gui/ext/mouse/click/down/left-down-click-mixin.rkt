#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "down-click-interface.rkt"))
(require (prefix-in left: "left-down-click-interface.rkt"))

(define left-clickable-mixin
  (mixin (click:down-click<%>) (left:left-down-click<%>)
    
    (super-new)
   
    (define/override (on-down-click click-type [x-pos 0] [y-pos 0]) 
      (match click-type 
        ['left-down (on-left-down-click x-pos y-pos)]
        [_ (super on-down-click click-type x-pos y-pos)]))
    
    
    (define/public (on-left-down-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
