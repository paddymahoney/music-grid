#lang racket

(require racket/gui/base)
(require "../../lang/left-to-right-composition.rkt")
(require (prefix-in mouse: "mouse-event-mixin.rkt"))
(require (prefix-in click: "clickable-mixin.rkt"))
(require (prefix-in pos: "mouse-move-mixin.rkt"))
(require (prefix-in scale: "scalable-mixin.rkt"))
(require (prefix-in size: "sizeable-mixin.rkt"))
(require (prefix-in release: "click-release-mixin.rkt"))
(require (prefix-in cdr: "click-drag-release-mixin.rkt"))



(define canvas++% (cdr:click-drag-release-mixin (release:click-release-mixin (scale:scalable-mixin (size:sizeable-mixin (pos:mouse-pos-mixin (click:clickable-mixin (mouse:mouse-event-mixin canvas%))))))))
  

(provide (all-defined-out))