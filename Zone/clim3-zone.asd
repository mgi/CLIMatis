(in-package #:common-lisp-user)

(asdf:defsystem :clim3-zone
  :depends-on (:rigidity)
  :components
  ((:file "zone-packages" :depends-on ())
   (:file "zone" :depends-on ("zone-packages"))))