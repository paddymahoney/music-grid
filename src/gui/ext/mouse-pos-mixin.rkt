#lang racket
(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))
(require (prefix-in pos: "mouse-pos-interface.rkt"))

(define motion-type? 
  (lambda (event-type)
    (match event-type
      [(or 'motion 'enter 'leave) #t]
      [_ #f])))

(define mouse-pos-mixin
  (mixin (mouse:mouse-event<%>) (pos:mouse-pos<%>)
    
    (super-new)
    
    (define/override (on-event mouse-event)
      (define event-type (send mouse-event get-event-type))
      (match (motion-type? event-type)
        [#t 
         (begin (define x-pos (send mouse-event get-x))
                (define y-pos (send mouse-event get-y))
                (on-mouse-move x-pos y-pos))]
        
        [_ (super on-event mouse-event)]))
    
    (define/public (on-mouse-move [x-pos 0] [y-pos 0]) 
      (void))))

(provide (all-defined-out))
