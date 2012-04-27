#lang racket

(require (prefix-in lbl: "info-labels.rkt"))
(require (prefix-in frame: "info-frame.rkt"))
               
#;(: update-on-size (Number Number Number Number Number Number Number Number Number Number Number Number -> Void))

(define update-on-size
  (lambda (a-width a-height a-row-height a-col-width an-x-pos a-y-pos row-pos col-pos a-left a-right a-top a-bottom)
    (send frame:width set-label (lbl:width a-width))
    (send frame:height set-label (lbl:height a-height))
    (send frame:row-height set-label (lbl:row-height a-row-height))
    (send frame:col-width set-label (lbl:col-width a-col-width))
    (send frame:left set-label (lbl:left a-left))
    (send frame:right set-label (lbl:right a-right))
    (send frame:top set-label (lbl:top a-top))
    (send frame:bottom set-label (lbl:bottom a-bottom))))   

#;(: update-on-mouse-move (Number Number Number Number Number Number Number Number -> Void))

(define update-on-mouse-move
  (lambda (an-x-pos a-y-pos a-row-pos a-col-pos a-left a-right a-top a-bottom)
    (send  frame:x-pos set-label (lbl:x-pos an-x-pos))
    (send  frame:y-pos set-label (lbl:y-pos a-y-pos))
    (send  frame:row-pos set-label (lbl:row-pos a-row-pos))
    (send  frame:col-pos set-label (lbl:col-pos a-col-pos))
    (send  frame:left set-label (lbl:left a-left))
    (send  frame:right set-label (lbl:right a-right))
    (send  frame:top set-label (lbl:top a-top))
    (send  frame:bottom set-label (lbl:bottom a-bottom))))

#;(: update-on-init (Number Number Number Number Number Number Number Number Number Number Number Number -> Void))

(define update-on-init
  (lambda (a-num-rows a-num-cols a-width a-height a-row-height a-col-width an-x-pos a-y-pos a-row-pos a-col-pos a-left a-right a-top a-bottom)
    (send  frame:num-rows set-label (lbl:num-rows a-num-rows))
    (send  frame:num-cols set-label (lbl:num-cols a-num-cols))
    (send  frame:width set-label (lbl:width a-width))
    (send  frame:height set-label (lbl:height a-height))
    (send  frame:row-height set-label (lbl:row-height a-row-height))
    (send  frame:col-width set-label (lbl:col-width a-col-width))
    (send  frame:x-pos set-label (lbl:x-pos an-x-pos))
    (send  frame:y-pos set-label (lbl:y-pos a-y-pos))
    (send  frame:row-pos set-label (lbl:row-pos a-row-pos))
    (send  frame:col-pos set-label (lbl:col-pos a-col-pos))
    (send  frame:left set-label (lbl:left a-left))
    (send  frame:right set-label (lbl:right a-right))
    (send  frame:top set-label (lbl:top a-top))
    (send  frame:bottom set-label (lbl:bottom a-bottom))))

(provide (all-defined-out))
