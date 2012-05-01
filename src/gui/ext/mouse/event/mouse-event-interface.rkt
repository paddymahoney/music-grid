#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in event: "../../event/event-interface.rkt"))


(define mouse-event<%>
  (interface (event:event<%>) on-mouse-event)) 

(provide (all-defined-out))
