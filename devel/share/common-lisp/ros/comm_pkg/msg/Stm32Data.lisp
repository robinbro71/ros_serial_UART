; Auto-generated. Do not edit!


(cl:in-package comm_pkg-msg)


;//! \htmlinclude Stm32Data.msg.html

(cl:defclass <Stm32Data> (roslisp-msg-protocol:ros-message)
  ((adc
    :reader adc
    :initarg :adc
    :type cl:integer
    :initform 0)
   (button
    :reader button
    :initarg :button
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Stm32Data (<Stm32Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stm32Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stm32Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comm_pkg-msg:<Stm32Data> is deprecated: use comm_pkg-msg:Stm32Data instead.")))

(cl:ensure-generic-function 'adc-val :lambda-list '(m))
(cl:defmethod adc-val ((m <Stm32Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm_pkg-msg:adc-val is deprecated.  Use comm_pkg-msg:adc instead.")
  (adc m))

(cl:ensure-generic-function 'button-val :lambda-list '(m))
(cl:defmethod button-val ((m <Stm32Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm_pkg-msg:button-val is deprecated.  Use comm_pkg-msg:button instead.")
  (button m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stm32Data>) ostream)
  "Serializes a message object of type '<Stm32Data>"
  (cl:let* ((signed (cl:slot-value msg 'adc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'button)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stm32Data>) istream)
  "Deserializes a message object of type '<Stm32Data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'adc) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'button)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stm32Data>)))
  "Returns string type for a message object of type '<Stm32Data>"
  "comm_pkg/Stm32Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stm32Data)))
  "Returns string type for a message object of type 'Stm32Data"
  "comm_pkg/Stm32Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stm32Data>)))
  "Returns md5sum for a message object of type '<Stm32Data>"
  "5fac1e529e3bbd879b45ff052f485b18")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stm32Data)))
  "Returns md5sum for a message object of type 'Stm32Data"
  "5fac1e529e3bbd879b45ff052f485b18")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stm32Data>)))
  "Returns full string definition for message of type '<Stm32Data>"
  (cl:format cl:nil "int32 adc~%uint8 button~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stm32Data)))
  "Returns full string definition for message of type 'Stm32Data"
  (cl:format cl:nil "int32 adc~%uint8 button~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stm32Data>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stm32Data>))
  "Converts a ROS message object to a list"
  (cl:list 'Stm32Data
    (cl:cons ':adc (adc msg))
    (cl:cons ':button (button msg))
))
