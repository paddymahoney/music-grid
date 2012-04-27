#lang racket

(require syntax/parse (for-syntax syntax/parse))

#|define-property is a new language form that provides C#-like properties within classes.|#
(define-syntax (define-property stx)
  (define make-id
    (lambda (template . ids)
      (define str (apply format template (map syntax->datum ids)))
      (datum->syntax stx (string->symbol str))))
  (syntax-parse stx 
                [((~literal define-property) name:id init-value)
                 (with-syntax ([getter-name (make-id "get-~a" #'name)]
                               [setter-name (make-id "set-~a" #'name)])
                   #'(begin (define name init-value)
                            (define/public (setter-name value)
                              (set! name value))
                            (define/public (getter-name)
                              name)))]
                [((~literal define-property) name:id init-value ((~literal get) getter-body))
                 (with-syntax ([getter-name (make-id "get-~a" #'name)])
                   #'(begin (define name init-value) 
                            (define/public (getter-name)
                              getter-body)))]
                [((~literal define-property) name:id init-value ((~literal set)  (setter-vars:id ...) set-body:expr))
                 (with-syntax ([setter-name (make-id "set-~a" #'name)])
                   #'(begin (define name init-value)
                            (define/public (setter-name setter-vars ...)
                              set-body)))]
                [((~literal define-property) name:id init-value ((~literal get) get-body) ((~literal set) (setter-bindings:id ...) set-body:expr))
                 
                 (with-syntax ([getter-name (make-id "get-~a" #'name)]
                               [setter-name (make-id "set-~a" #'name)])
                   #'(begin (define name init-value)
                            (define/public (setter-name setter-bindings ...)
                              set-body)
                            (define/public (getter-name)
                              get-body)))]))

(provide define-property)