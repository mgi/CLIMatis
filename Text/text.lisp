(in-package #:clim3-text)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Text zone.
;;;
;;; For now, the text style is a dummy, because we have only one. 

(defclass text (clim3-graphics:monochrome)
  ((%style :initarg :style :reader style)
   (%chars :initform (make-array 5 :element-type 'character
				   :fill-pointer 0
				   :adjustable t)
	   :reader chars)))

(defmethod initialize-instance :after ((zone text) &key (chars ""))
  (loop for char across chars
	do (vector-push-extend char (chars zone))))

(defmethod clim3-zone:compute-gives ((zone text))
  (setf (clim3-zone:hgive zone)
	(rigidity:very-rigid
	 (clim3-port:text-width (clim3-zone:client zone)
				(style zone)
				(chars zone))))
  (setf (clim3-zone:vgive zone)
	(rigidity:very-rigid
	 (+ (clim3-port:text-style-ascent
	     (clim3-zone:client zone) (style zone))
	    (clim3-port:text-style-descent
	     (clim3-zone:client zone) (style zone))))))

(defun text (string style color)
  (make-instance 'text :style style :chars string :color color))
  

