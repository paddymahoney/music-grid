#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mix: "sizeable-mixin.rkt"))

(define sizeable-canvas%
  (mix:sizeable-mixin canvas%))

(provide (all-defined-out))
