#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "click-release-interface.rkt"))
(require (prefix-in mouse: "../mouse-event/mouse-event-interface.rkt"))

(define release-type? 
  (lambda (event-type)
    (match event-type
      [(or 'left-up 'right-up 'middle-up) #t]
      [_ #f])))

(define click-release-mixin
  (mixin (mouse:mouse-event<%>) (click:click-up<%>)
    
    (super-new)
    
 
    (define/override (on-event mouse-event) 
      (define event-type (send mouse-event get-event-type))
      (match (release-type? event-type)
        [#t 
         (define x-pos (send mouse-event get-x))
         (define y-pos (send mouse-event get-y))
         (on-click-up event-type x-pos y-pos)]
        [_ (super on-event mouse-event)]))
    
    (define/public (on-click-up event-type x-pos y-pos)
      (void))))

(provide (all-defined-out))
