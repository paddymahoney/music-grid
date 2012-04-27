#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))

(define mouse-event-mixin 
  (mixin (canvas<%>) (mouse:mouse-event<%>)
    (super-new)))

(provide (all-defined-out))
