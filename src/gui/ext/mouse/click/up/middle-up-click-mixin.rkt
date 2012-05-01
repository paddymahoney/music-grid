#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "up-click-interface.rkt"))
(require (prefix-in middle: "middle-up-click-interface.rkt"))

(define middle-up-click-mixin
  (mixin (click:up-click<%>) (middle:middle-up-click<%>)
    
    (super-new)
   
    (define/override (on-up-click click-type x-pos y-pos) 
      (match click-type 
        ['middle-up (on-middle-up-click x-pos y-pos)]
        [_ (super on-up-click click-type x-pos y-pos)]))
    
    
    (define/public (on-middle-up-click x-pos y-pos)
      (void))))

(provide (all-defined-out))
