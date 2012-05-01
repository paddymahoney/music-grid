#lang racket
(require racket/class)
(require (prefix-in click: "up-click-interface.rkt"))
(require (prefix-in right: "right-up-click-interface.rkt"))

(define right-up-click-mixin
  (mixin (click:up-click<%>) (right:right-up-click<%>)
    
    (super-new)
   
    (define/override (on-up-click click-type x-pos y-pos) 
      (match click-type 
        ['right-up (on-right-up-click x-pos y-pos)]
        [_ (super on-up-click click-type x-pos y-pos)]))
    
    
    (define/public (on-right-up-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
