#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "../click-interface.rkt"))
(require (prefix-in down: "down-click-interface.rkt"))

(define down-click->button
  (lambda (down-click)
    (match down-click
      ['left-down 'left]
      ['right-down 'right]
      ['middle-down 'middle])))

(define down-click? 
  (lambda (click-type)
    (match click-type
      [(or 'left-down 'right-down 'middle-down) #t]
      [_ #f])))

(define down-click-mixin
  (mixin (click:click<%>) (down:down-click<%>)
    
    (super-new)
    
    (define/override (on-click click-type x-pos y-pos)
      (match (down-click? click-type)
        [#t 
         (define down-click-type click-type)
         (on-click down-click-type x-pos y-pos)]
        [_ (super on-click click-type )]))
   
    (define/public (on-down-click down-click-type [x-pos 0] [y-pos 0])
      (void))))

(provide (all-defined-out))
