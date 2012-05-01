#lang racket

(require racket/class)
(require (prefix-in mouse: "../event/mouse-event-interface.rkt"))

(define mouse-move<%>
  (interface (mouse:mouse-event<%>) on-mouse-move)) 


(provide (all-defined-out))

