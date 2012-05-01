#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "../event/mouse-event-interface.rkt"))

(define click<%>
  (interface (mouse:mouse-event<%>) on-click))

(provide (all-defined-out))