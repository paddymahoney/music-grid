#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mouse: "../click-interface.rkt"))

(define down-click<%>
  (interface (mouse:click<%>) on-down-click))

(provide (all-defined-out))