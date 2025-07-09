;; Auto-generated. Do not edit!


(when (boundp 'comm_pkg::Stm32Data)
  (if (not (find-package "COMM_PKG"))
    (make-package "COMM_PKG"))
  (shadow 'Stm32Data (find-package "COMM_PKG")))
(unless (find-package "COMM_PKG::STM32DATA")
  (make-package "COMM_PKG::STM32DATA"))

(in-package "ROS")
;;//! \htmlinclude Stm32Data.msg.html


(defclass comm_pkg::Stm32Data
  :super ros::object
  :slots (_adc _button ))

(defmethod comm_pkg::Stm32Data
  (:init
   (&key
    ((:adc __adc) 0)
    ((:button __button) 0)
    )
   (send-super :init)
   (setq _adc (round __adc))
   (setq _button (round __button))
   self)
  (:adc
   (&optional __adc)
   (if __adc (setq _adc __adc)) _adc)
  (:button
   (&optional __button)
   (if __button (setq _button __button)) _button)
  (:serialization-length
   ()
   (+
    ;; int32 _adc
    4
    ;; uint8 _button
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _adc
       (write-long _adc s)
     ;; uint8 _button
       (write-byte _button s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _adc
     (setq _adc (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _button
     (setq _button (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get comm_pkg::Stm32Data :md5sum-) "5fac1e529e3bbd879b45ff052f485b18")
(setf (get comm_pkg::Stm32Data :datatype-) "comm_pkg/Stm32Data")
(setf (get comm_pkg::Stm32Data :definition-)
      "int32 adc
uint8 button
")



(provide :comm_pkg/Stm32Data "5fac1e529e3bbd879b45ff052f485b18")


