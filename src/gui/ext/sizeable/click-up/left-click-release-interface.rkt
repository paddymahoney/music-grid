#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in rls: "click-release-interface.rkt"))

(define left-click-up<%>
  (interface (rls:click-up<%>) on-left-click-up))

(provide (all-defined-out))