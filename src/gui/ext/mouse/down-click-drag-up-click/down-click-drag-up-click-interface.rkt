#lang racket

(require racket/gui/base)
(require racket/class)
(require (prefix-in down: "../click/down/down-click-interface.rkt"))
(require (prefix-in up: "../click/up/up-click-interface.rkt"))

(define down-click-drag-up-click<%>
  (interface (down:down-click<%> up:up-click<%>) on-down-click-drag-up-click))

(provide (all-defined-out))