#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "down-click-interface.rkt"))
(require (prefix-in middle: "middle-down-click-interface.rkt"))

(define middle-clickable-mixin
  (mixin (click:down-click<%>) (middle:middle-down-click<%>)
    
    (super-new)
   
    (define/override (on-down-click click-type x-pos y-pos) 
      (match click-type 
        ['middle-down (on-middle-down-click x-pos y-pos)]
        [_ (super on-down-click click-type x-pos y-pos)]))
    
    
    (define/public (on-middle-down-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
