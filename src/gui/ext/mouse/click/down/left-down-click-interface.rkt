#lang racket
(require racket/class)
(require (prefix-in click: "down-click-interface.rkt"))

(define left-down-click<%>
  (interface (click:down-click<%>) on-left-click-down))

(provide (all-defined-out))