#lang racket
(require racket/gui/base)
(require racket/class)
(require (prefix-in mix: "mouse-event-mixin.rkt"))

(define mouse-event-canvas% (mix:mouse-event-mixin canvas%))

(provide (all-defined-out))