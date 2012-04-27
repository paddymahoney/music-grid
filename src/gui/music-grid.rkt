#lang racket
(require racket/gui/base)
(require racket/class)
(require racket/draw)

(require "../lang/define-property.rkt")
(require (prefix-in lbl: "grid-canvas/info-labels.rkt"))
(require (prefix-in dc: "ext/dc-utils.rkt"))
(require (prefix-in draw: "grid-canvas/grid-drawing.rkt"))
(require (prefix-in info: "grid-canvas/info-updaters.rkt"))
(require (prefix-in canvas: "ext/canvas++.rkt"))
(require (prefix-in calc: "grid-canvas/grid-calculations.rkt"))
(require (prefix-in grid: "grid-canvas/grid-canvas.rkt"))

(define num-rows 20)
(define num-cols 20)

#|Drawing functions|#
(define draw-note-layer
  (lambda (dc note-layer)
    (send dc draw-path note-layer)))

#|Main frame drawing|#
(define frame (new frame% 
                   [label "App"]
                   [width 200]
                   [height 200]
                   [enabled #t]))

(define music-canvas%
  (class grid:grid-canvas%
    (inherit get-dc get-left get-top get-row-height get-col-width)
    (super-new)
    (init [init-note-layer (new dc-path%)])
    
    
    #|A music grid has a note-layer. A note layer represents all the notes drawn over the grid. This is represented as a racket dc-path%. See  
http://docs.racket-lang.org/draw/dc-path_.html|#
    (define-property note-layer init-note-layer
      (get note-layer))
    
    (define update-note-layer
      (lambda (note-path)
        (send (get-note-layer) append note-path)))
    
    (define/override (on-click x-pos y-pos) 
      
      (define note-path (make-note-path (get-left) (get-top) (get-row-height) (get-col-width)))
      (update-note-layer note-path)
      (draw-note-layer (get-dc) (get-note-layer)))
    
    (define/override (on-scale width height x-scale y-scale)
      (displayln "ASSHO")
      (send (get-note-layer) scale x-scale y-scale)
      (draw-note-layer (get-dc) (get-note-layer))
      )
    ))

#|Windowing and painting. |#           

(define canvas (new music-canvas%
                    [parent frame]
                    [paint-callback (draw:grid-painter num-rows num-cols)]
                    [init-num-rows num-rows]
                    [init-num-cols num-cols]
                    [init-note-layer (new dc-path%)]))

(send frame show #t)
(define dc (send canvas get-dc))

(send dc set-smoothing 
      'smoothed)

(define make-note-path
  (lambda (left top row-height col-width)
    (define dc-path (new dc-path%))
    (send dc-path rounded-rectangle
          left
          top
          col-width
          row-height)
    dc-path))


