#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "click-release-interface.rkt"))
(require (prefix-in left: "left-click-release-interface.rkt"))

(define click-release-mixin
  (mixin (click:click-up<%>) (left:left-click-up<%>)
    
    (super-new)

    (define/override (on-click-up up-button x-pos y-pos)
      (match up-button
        ['left (on-left-click-up x-pos y-pos)]
        [_ (super on-click-up up-button x-pos y-pos)]
             ))
    
    (define/public (on-left-click-up x-pos y-pos)
      (void))))

(provide (all-defined-out))
