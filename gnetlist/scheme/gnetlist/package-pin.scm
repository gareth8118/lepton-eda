(define-module (gnetlist package-pin)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-9 gnu)
  #:export (make-package-pin package-pin?
            package-pin-id set-package-pin-id!
            package-pin-object set-package-pin-object!
            package-pin-type set-package-pin-type!
            package-pin-number set-package-pin-number!
            package-pin-name set-package-pin-name!
            package-pin-label set-package-pin-label!
            package-pin-attribs set-package-pin-attribs!
            package-pin-nets set-package-pin-nets!
            set-package-pin-printer!))

(define-record-type <package-pin>
  (make-package-pin id object type number name label attribs nets)
  package-pin?
  (id package-pin-id set-package-pin-id!)
  (object package-pin-object set-package-pin-object!)
  (type package-pin-type set-package-pin-type!)
  (number package-pin-number set-package-pin-number!)
  (name package-pin-name set-package-pin-name!)
  (label package-pin-label set-package-pin-label!)
  (attribs package-pin-attribs set-package-pin-attribs!)
  (nets package-pin-nets set-package-pin-nets!))

;;; Sets default printer for <package-pin>
(set-record-type-printer!
 <package-pin>
 (lambda (record port) (format port "#<geda-package-pin ~A>" (package-pin-id record))))

(define (set-package-pin-printer! format-string . args)
  "Adjust pretty-printing of <package-pin> records.
FORMAT-STRING must be in the form required by the procedure
`format'. The following ARGS may be used:
  'id
  'object
  'type
  'number
  'name
  'label
  'attribs
  'nets
Any other unrecognized argument will lead to yielding '?' in the
corresponding place.
Example usage:
  (set-package-pin-printer! \"<package-pin-~A (~A)>\" 'id 'number)"
  (set-record-type-printer!
   <package-pin>
   (lambda (record port)
     (apply format port format-string
            (map
             (lambda (arg)
               (match arg
                 ('id (package-pin-id record))
                 ('object (package-pin-object record))
                 ('type (package-pin-type record))
                 ('number (package-pin-number record))
                 ('name (package-pin-name record))
                 ('label (package-pin-label record))
                 ('attribs (package-pin-attribs record))
                 ('nets (package-pin-nets record))
                 (_ #\?)))
             args)))))
