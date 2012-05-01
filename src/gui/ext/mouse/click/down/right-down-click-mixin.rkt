#lang racket
(require racket/class)
(require (prefix-in click: "down-click-interface.rkt"))
(require (prefix-in right: "right-down-click-interface.rkt"))

(define right-down-click-mixin
  (mixin (click:down-click<%>) (right:right-down-click<%>)
    
    (super-new)
   
    (define/override (on-down-click click-type x-pos y-pos) 
      (match click-type 
        ['right-down (on-right-down-click x-pos y-pos)]
        [_ (super on-down-click click-type x-pos y-pos)]))
    
    
    (define/public (on-right-down-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
