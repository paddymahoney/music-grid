#lang racket
(require racket/gui/base)
(require racket/class)

(define mouse-event<%>
  (interface () on-event)) 

(provide (all-defined-out))
