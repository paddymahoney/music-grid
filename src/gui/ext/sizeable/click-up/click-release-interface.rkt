#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "../mouse-event/mouse-event-interface.rkt"))

(define click-up<%>
  (interface (mouse:mouse-event<%>) on-click-up))

(provide (all-defined-out))