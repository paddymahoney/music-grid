#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in click: "up-click-interface.rkt"))

(define middle-up-click<%>
  (interface (click:up-click<%>) on-middle-up-click))

(provide (all-defined-out))