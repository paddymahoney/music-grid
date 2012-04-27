#lang racket
(require racket/gui/base)
(require (prefix-in lbl: "info-labels.rkt"))
(require (prefix-in dc: "../ext/dc-utils.rkt"))

(define info-frame
    (new frame% 
         [label "Info"]
         [width 200]
         [height 200]
         [min-width 200]	 
         [min-height 200]
         [enabled #t]))

(define make-message
  (lambda (frame init-label)
    (new message% 
         [parent frame]
         [label init-label]
         [auto-resize #t])))

#|Messages|#

#|Init the labels to 0, there aren't values until mouse-events occur. |#
(define num-rows (make-message info-frame (lbl:num-rows 0)))
(define num-cols (make-message info-frame (lbl:num-cols 0)))
(define width (make-message info-frame (lbl:width 0)))
(define height (make-message info-frame (lbl:height 0)))
(define row-height (make-message info-frame (lbl:row-height 0)))
(define col-width (make-message info-frame (lbl:col-width 0)))
(define row-pos (make-message info-frame (lbl:row-pos 0)))
(define col-pos (make-message info-frame (lbl:col-pos 0)))
(define x-pos (make-message info-frame (lbl:x-pos 0)))
(define y-pos (make-message info-frame (lbl:y-pos 0)))
(define left (make-message info-frame (lbl:left 0)))
(define right (make-message info-frame (lbl:right 0)))
(define top (make-message info-frame (lbl:top 0)))
(define bottom (make-message info-frame (lbl:bottom 0)))

(send info-frame show #t)

(provide (all-defined-out))

