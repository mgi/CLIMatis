(in-package #:clim3-text)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Text zone.

(defclass text (clim3:monochrome)
  ((%style :initarg :style :reader style)
   (%chars :initarg :chars
	   :initform (make-array 0 :element-type 'character)
	   :reader chars)))

(defmethod (setf clim3-ext:parent) :after ((new-parent null) (zone text))
  (setf (clim3:hsprawl zone) nil)
  (setf (clim3:vsprawl zone) nil))

(defmethod clim3-ext:compute-hsprawl ((zone text))
  (setf (clim3-ext:hsprawl zone)
	(let ((width (clim3:text-width (clim3-ext:client zone)
				       (style zone)
				       (chars zone))))
	  (clim3-sprawl:sprawl width width width))))

(defmethod clim3-ext:compute-vsprawl ((zone text))
  (setf (clim3-ext:vsprawl zone)
	(let ((height (+ 1 (clim3:text-style-ascent
                            (clim3-ext:client zone) (style zone))
			 (clim3:text-style-descent
			  (clim3-ext:client zone) (style zone)))))
	  (clim3-sprawl:sprawl height height height))))

(defun text (string style color)
  (make-instance 'text :style style :chars string :color color))
  
(defmethod clim3-ext:paint ((zone text))
  (clim3:paint-text (chars zone) (style zone) (clim3:color zone)))

