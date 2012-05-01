#lang racket
(require racket/class)

(define event<%>
  (interface () on-event)) 

(provide (all-defined-out))
