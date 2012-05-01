#lang racket

(require racket/gui/base)
(require racket/class)
(require "../../../../lang/define-property.rkt")
(require (prefix-in down: "../click/down/down-click-interface.rkt"))
(require (prefix-in up: "../click/up/up-click-interface.rkt"))
(require (prefix-in release: "../click/up/up-click-interface.rkt"))
(require (prefix-in cdr: "down-click-drag-up-click-interface.rkt"))
(require (prefix-in btn: "../event/mouse-event-type-to-button.rkt"))


(define click-drag-release-mixin
  (mixin (down:down-click<%> up:up-click<%>) (cdr:down-click-drag-up-click<%>)
    
    (super-new)
    
    (define-property button 'none
      (get button))
    
    (define-property start-pos-x 'none
      (get start-pos-x))
    
    (define-property start-pos-y 'none
      (get start-pos-y))
    
    (define/override (on-down-click click-type x-pos y-pos)
      (displayln "WHOOORE")
      (set! button (btn:mouse-event-type->button-type click-type))
      (set! start-pos-x x-pos)
      (set! start-pos-y y-pos)
      (super on-down-click click-type x-pos y-pos))
    
    (define/override (on-up-click release-type x-pos y-pos)
      (define release-button (btn:mouse-event-type->button-type release-type))
      (match release-button
        [click-type (on-click-drag-release release-button (get-start-pos-x) (get-start-pos-y) x-pos y-pos)]
        [_ (void)]))
  
(define/public (on-click-drag-release click-type start-x start-y end-x end-y)
  (void))))
  

(provide (all-defined-out))
