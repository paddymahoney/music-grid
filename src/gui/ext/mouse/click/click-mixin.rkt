#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "click-interface.rkt"))
(require (prefix-in mouse: "../event/mouse-event-interface.rkt"))

(define is-click-type? 
  (lambda (mouse-event-type)
    (match mouse-event-type
      [(or 'left-down 'left-up 'middle-down 'middle-up 'right-down 'right-up) #t]
      [_ #f])))

(define click-mixin
  (mixin (mouse:mouse-event<%>) (click:click<%>)
    
    (super-new)
   
    (define/override (on-mouse-event event-type x-pos y-pos) 
      (match (is-click-type? event-type)
        ['#t 
         (define click-type event-type)
         (on-click click-type x-pos y-pos)]
        [_
         (super on-mouse-event event-type x-pos y-pos)]))
    
    
    (define/public (on-click click-type x-pos y-pos)
      (void))))

(provide (all-defined-out))
