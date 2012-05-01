#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))
(require (prefix-in event: "../../event/event-interface.rkt"))

(define mouse-event-mixin 
  (mixin (event:event<%>) (mouse:mouse-event<%>)
    (super-new)
    
    (define/override (on-event mouse-event)
      (define event-type (send mouse-event get-event-type))
      (define x-pos (send mouse-event get-x))
      (define y-pos (send mouse-event get-y))
      (on-mouse-event event-type x-pos y-pos))
    
    (define/public (on-mouse-event event-type x-pos y-pos)
      (void))))

(provide (all-defined-out))
