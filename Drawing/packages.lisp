(cl:in-package #:common-lisp-user)

(defpackage #:clim3-rendering
  (:use #:common-lisp)
  (:export
   #:render-trapezoids
   #:render-polygons
   #:trapezoids-from-polygons
   #:render-path))
