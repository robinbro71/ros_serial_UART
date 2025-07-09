
(cl:in-package :asdf)

(defsystem "comm_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Stm32Data" :depends-on ("_package_Stm32Data"))
    (:file "_package_Stm32Data" :depends-on ("_package"))
  ))