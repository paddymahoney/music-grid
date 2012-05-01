#lang racket

(require racket/gui/base)
(require racket/class)

(require (prefix-in click: "up-click-interface.rkt"))

(define right-up-click<%>
  (interface (click:up-click<%>) on-right-up-click))

(provide (all-defined-out))