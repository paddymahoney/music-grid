#lang racket

(require syntax/parse (for-syntax syntax/parse))

#|--> is a forward composition operator.|#
(define-syntax (--> stx)
  (syntax-parse stx #:literals #'-->
                [(--> function ...)
                   #'(compose (reverse (list function ...)))]))
                
(provide (all-defined-out))