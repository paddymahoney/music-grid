#lang racket
#;(define (call-in-other-eventspace e thunk)
   (let ([ch (make-channel)])
     (parameterize ([current-eventspace e])
       (queue-callback (lambda ()
                         (channel-put ch (thunk)))))
     (channel-get ch))) 

(define (call-in-other-eventspace e thunk)
   (parameterize ([current-eventspace e])
       (queue-callback thunk))) 


#;(define width-msg (new message% 
                       [parent info-frame]
                       [label (label-width 0)]
                       [auto-resize #t]))

#;(define height-msg (new message% 
                        [parent info-frame]
                        [label (label-height 0)]
                        [auto-resize #t]))
#;(define x-pos-msg (new message% 
                           [parent info-frame]
                           [label (label-x-pos 0)]
                           [auto-resize #t]))

#;(define y-pos-msg (new message% 
                           [parent info-frame]
                           [label (label-y-pos 0)]
                           [auto-resize #t]))


#;(define num-cols-msg (new message% 
                        [parent info-frame]
                        [label (lbl:num-cols num-cols)]
                        [auto-resize #t]))

#;(define num-rows-msg (new message% 
                        [parent info-frame]
                        [label (lbl:num-rows num-rows)]
                        [auto-resize #t]))

#;(define bottom-msg (new message%
                        [parent info-frame]
                        [label (label-bottom 0)]
                        [auto-resize #t]))

#;(define top-msg (new message% 
                     [parent info-frame]
                     [label (label-top 0)]
                     [auto-resize #t]))

#;(define right-msg (new message% 
                       [parent info-frame]
                       [label (label-right 0)]
                       [auto-resize #t]))

#;(define left-msg (new message% 
                      [parent info-frame]
                      [label (label-left 0)]
                      [auto-resize #t]))

#;(define col-width-msg (new message% 
                             [parent info-frame]
                             [label (label-col-width 0)]
                             [auto-resize #t]))


#;(define row-height-msg (new message% 
                             [parent info-frame]
                             [label (label-row-height 0)]
                             [auto-resize #t]))
#;(define col-pos-msg (new message% 
                             [parent info-frame]
                             [label (label-col-pos 0)]
                             [auto-resize #t]))
#;(define row-pos-msg (new message% 
                             [parent info-frame]
                             [label (label-row-pos 0)]
                             [auto-resize #t]))  