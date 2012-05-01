#lang racket
(require racket/gui/base)
(require racket/class)
(require "../../lang/define-property.rkt")
(require (prefix-in size: "sizeable-interface.rkt"))
(require (prefix-in scale: "scalable-interface.rkt"))


(define scalable-mixin
  (mixin (size:sizeable<%>) (scale:scalable<%>)
    
    (super-new)
    
    (define-property old-width 0
       (set (new-width) (set! old-width new-width)))
    
    (define-property old-height 0
      (set (new-height) (set! old-height new-height)))
    
    (define/override (on-size width height) 
      (define scale-x 
        (if (not (= 0 old-width))
            (/ width old-width)
            1))
      (define scale-y (if (not (= 0 old-height))
                          (/ height old-height)
                          1))
      (set-old-width width)
      (set-old-height height)
      (on-scale scale-x scale-y))
    
    (define/public (on-scale scale-x scale-y)
      (void))
    ))

(provide (all-defined-out))
