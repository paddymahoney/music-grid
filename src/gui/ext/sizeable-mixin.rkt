#lang racket
(require racket/gui/base)
(require (prefix-in size: "sizeable-interface.rkt"))

(define sizeable-mixin 
  (mixin (window<%>) (size:sizeable<%>)
    (super-new)))

(provide (all-defined-out))