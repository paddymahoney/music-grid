#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "mouse-event-interface.rkt"))

(define clickable<%>
  (interface (mouse:mouse-event<%>) on-click))

(provide (all-defined-out))