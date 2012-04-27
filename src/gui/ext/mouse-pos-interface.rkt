#lang racket

(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))

(define mouse-pos<%>
  (interface (mouse:mouse-event<%>) on-mouse-move)) 


(provide (all-defined-out))

