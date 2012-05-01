#lang racket

(require racket/gui/base)
(require racket/class)

(require (prefix-in click: "down-click-interface.rkt"))

(define right-down-click<%>
  (interface (click:down-click<%>) on-right-down-click))

(provide (all-defined-out))