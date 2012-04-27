#lang racket
(require (prefix-in size: "sizeable-interface.rkt"))

(define scalable<%> (interface (size:sizeable<%>) on-scale))

(provide (all-defined-out))




