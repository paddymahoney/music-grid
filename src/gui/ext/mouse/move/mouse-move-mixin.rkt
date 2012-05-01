#lang racket
(require racket/class)
(require racket/gui/base)
(require (prefix-in event: "../../event/event-interface.rkt"))
(require (prefix-in pos: "mouse-move-interface.rkt"))

(define mouse-event?
  (lambda (mouse-event)
    (is-a? mouse-event mouse-event%)))
                                      

(define mouse-pos-mixin
  (mixin (event:event<%>) (pos:mouse-move<%>)
    
    (super-new)
    
    (define/override (on-event event)
      (match (mouse-event? event)
        [#t 
         (define mouse-event event)
         (define x-pos (send mouse-event get-x))
         (define y-pos (send mouse-event get-y))
         (on-mouse-move x-pos y-pos)]
        [_ (super on-event event)]))
    
    (define/public (on-mouse-move x-pos y-pos) 
      (void))))

(provide (all-defined-out))
