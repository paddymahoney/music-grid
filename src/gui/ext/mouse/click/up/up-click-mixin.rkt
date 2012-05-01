#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "../click-interface.rkt"))
(require (prefix-in up: "up-click-interface.rkt"))

(define up-click? 
  (lambda (event-type)
    (match event-type
      [(or 'left-up 'right-up 'middle-up) #t]
      [_ #f])))

(define up-click-mixin
  (mixin (click:click<%>) (up:up-click<%>)
    
    (super-new)
    
    (define/override (on-click click-type x-pos y-pos)
      (match (up-click? click-type)
        [#t
         (define up-click-type click-type)
         (on-up-click up-click-type x-pos y-pos)]
        [#f (super on-click click-type x-pos y-pos)]))
    
    (define/public (on-up-click click-type x-pos y-pos)
      (void))))

(provide (all-defined-out))
