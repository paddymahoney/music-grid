#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))
(require (prefix-in click: "clickable-interface.rkt"))

(define click-type? 
  (lambda (event-type)
    (match event-type
      [(or 'left-down 'right-down 'middle-down) #t]
      [_ #f])))

(define clickable-mixin
  (mixin (mouse:mouse-event<%>) (click:clickable<%>)
    
    (super-new)
    
    (define/override (on-event mouse-event)
      (define event-type (send mouse-event get-event-type))
      (match (click-type? event-type)
        [#t 
         (define x-pos (send mouse-event get-x))
         (define y-pos (send mouse-event get-y))
         (on-click x-pos y-pos)]
        [_ (super on-event mouse-event)]))
    
    (define/public (on-click click-type [x-pos 0] [y-pos 0]) 
      (void))))

(provide (all-defined-out))
