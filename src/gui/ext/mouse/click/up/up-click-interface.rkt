#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "../../event/mouse-event-interface.rkt"))

(define up-click<%>
  (interface (mouse:mouse-event<%>) on-up-click))

(provide (all-defined-out))