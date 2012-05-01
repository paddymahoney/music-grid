#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "down-click-interface.rkt"))

(define middle-down-click<%>
  (interface (click:down-click<%>) on-middle-down-click))

(provide (all-defined-out))