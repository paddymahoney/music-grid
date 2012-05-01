#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mix: "sizeable-scalable-mixin.rkt"))
(require (prefix-in size: "sizeable-canvas.rkt"))

(define scalable-canvas%
  (mix:sizeable<%>->scalable<%>-mixin size:sizeable-canvas%))

(provide (all-defined-out))
