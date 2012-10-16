(defpackage #:clim3-zone
  (:use #:common-lisp)
  (:export
   #:zone
   #:zone-p
   #:parent
   #:hpos #:vpos #:set-hpos #:set-vpos
   #:width #:height #:set-width #:set-height
   #:hgive #:vgive #:set-hgive #:set-vgive
   #:depth #:set-depth
   #:client
   #:natural-size
   #:children
   #:map-over-children
   #:map-over-children-top-to-bottom
   #:map-over-children-bottom-to-top
   #:compute-gives
   #:combine-child-gives
   #:notify-connect
   #:notify-disconnect
   #:notify-child-gives-invalid
   #:invalidate-gives
   #:impose-layout
   #:atomic-zone
   #:compound-zone
   #:compound-simple-zone
   #:compound-sequence-zone
   #:dependent-gives-mixin
   #:hdependent-gives-mixin
   #:vdependent-gives-mixin
   #:independent-gives-mixin
   #:at-most-one-child-mixin
   #:any-number-of-children-mixin
   ))
