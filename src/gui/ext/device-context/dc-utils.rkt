#lang racket

(require racket/class)

#|Max functions
These produce the  and  coordinates given a device context.|#
(define width
  (lambda (dc)
    (comp-max 'x dc)))

(define height
  (lambda (dc)
    (comp-max 'y dc)))

;;dc->comp->max
(define comp-max
  (lambda (x-or-y? dc)
    (define-values (width height) 
      (send dc get-size))
    (case x-or-y?
      ['x width]
      ['y height])))

(provide (all-defined-out))
