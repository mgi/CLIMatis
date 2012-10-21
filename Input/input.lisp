(in-package #:clim3-input)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class INPUT.
;;;
;;; An input zone is very elastic.  Client code will stick the input
;;; zone in a compound zone on top of some more rigid zones. 

(defclass input (clim3-zone:atomic-zone)
  ()
  (:default-initargs :vsprawl (clim3-sprawl:sprawl 0 0 nil)
		     :hsprawl (clim3-sprawl:sprawl 0 0 nil)))

(defmethod clim3-zone:sprawls-valid-p ((zone input))
  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class KEY-PRESS.
;;;
;;; The handler is called with the following arguments:
;;;
;;;   the zone
;;;   key-code   
;;;   modifiers

(defclass key-press (input)
  ((%handler :initarg :handler :reader handler)))

(defun key-press (handler)
  (make-instance 'key-press :handler handler))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class KEY-RELEASE.
;;;
;;; The handler is called with the following arguments:
;;;
;;;   the zone
;;;   key-code   
;;;   modifiers

(defclass key-release (input)
  ((%handler :initarg :handler :reader handler)))

(defun key-release (handler)
  (make-instance 'key-release :handler handler))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class BUTTON
;;;
;;; The handlers are called with the following arguments:
;;;
;;;   the zone
;;;   button-code   
;;;   modifiers

(defclass button (input)
  ((%press-handler :initarg :press-handler :reader press-handler)
   (%release-handler :initarg :release-handler :reader release-handler)))

(defun button (press-handler release-handler)
  (make-instance 'button
		 :press-handler press-handler
		 :release-handler release-handler))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class VISIT
;;;
;;; The handlers are called with the following arguments:
;;;
;;;   the zone

(defclass visit (input)
  ((%enter-handler :initarg :enter-handler :reader enter-handler)
   (%leave-handler :initarg :leave-handler :reader leave-handler)))

(defun visit (enter-handler leave-handler)
  (make-instance 'visit
		 :enter-handler enter-handler
		 :leave-handler leave-handler))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class MOTION.
;;;
;;; The handler is called with the following arguments:
;;;
;;;   the zone
;;;   hpos
;;;   vpos

(defclass motion (input)
  ((%handler :initarg :handler :reader handler)))

(defun motion (handler)
  (make-instance 'motion :handler handler))

