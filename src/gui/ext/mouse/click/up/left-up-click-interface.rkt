#lang racket
(require racket/class)
(require (prefix-in click: "up-click-interface.rkt"))

(define left-up-click<%>
  (interface (click:up-click<%>) on-left-click-up))

(provide (all-defined-out))