#lang racket
(require racket/class)
(require (prefix-in mouse: "../event/mouse-event-interface.rkt"))
(require (prefix-in pos: "mouse-move-interface.rkt"))

(define motion-type? 
  (lambda (event-type)
    (match event-type
      [(or 'motion 'enter 'leave) #t]
      [_ #f])))

(define mouse-pos-mixin
  (mixin (mouse:mouse-event<%>) (pos:mouse-move<%>)
    
    (super-new)
    
    (define/override (on-mouse-event event-type x-pos y-pos)
      (match (motion-type? event-type)
        [#t (on-mouse-move x-pos y-pos)]
        
        [_ (super on-mouse-event event-type x-pos y-pos)]))
    
    (define/public (on-mouse-move x-pos y-pos) 
      (void))))

(provide (all-defined-out))
