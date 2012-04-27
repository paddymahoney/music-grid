#lang racket
(require racket/class)
(require racket/gui/base)
(require (prefix-in click: "clickable-mixin.rkt"))
(require (prefix-in mouse: "mouse-event-canvas.rkt"))

(define clickable-canvas% 
  (click:clickable-mixin mouse:mouse-event-canvas%))

(provide (all-defined-out))