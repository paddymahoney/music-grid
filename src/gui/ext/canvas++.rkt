#lang racket

(require racket/gui/base)
(require "../../lang/left-to-right-composition.rkt")
(require (prefix-in mouse: "mouse-event-mixin.rkt"))
(require (prefix-in click: "clickable-mixin.rkt"))
(require (prefix-in pos: "mouse-pos-mixin.rkt"))
(require (prefix-in scale: "scalable-mixin.rkt"))
(require (prefix-in size: "sizeable-mixin.rkt"))



(define canvas++% (scale:scalable-mixin (size:sizeable-mixin (pos:mouse-pos-mixin (click:clickable-mixin (mouse:mouse-event-mixin canvas%))))))
  

(provide (all-defined-out))