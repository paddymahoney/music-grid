#lang typed/racket

(: mouse-event-type->button-type ((U 'left-up 'left-down 'right-up 'right-down 'middle-up 'middle-down) -> (U 'left 'right 'middle 'none)))


(define mouse-event-type->button-type
  (lambda (event-type)
    (match event-type
      ['left-up 'left]
      ['left-down 'left]
      ['right-up 'right]
      ['right-down 'right]
      ['middle-up 'middle]
      ['middle-down 'middle]
      [_ 'none])))

(provide (all-defined-out))

               
                   
                 
             