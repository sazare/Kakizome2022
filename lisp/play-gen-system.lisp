;; play code for genexp

(asdf:load-system :genexp)

(in-package :genexp)

;; for gen-symbol
(defparameter acc1 (make-acc '((p 2 5)(q 1 20)(r 3 5))))

(choose-symbol acc1)  ;; p, q and r with 1:4:1

;; for gen-term
(defparameter *fundef* '((f1 3 3)(f2 1 6)(f3 4 1)))
(defparameter *predef* '((p1 1 5)(p2 2 3)(p3 3 1)(p4 4 1)))
(defparameter *0symdef* '((a 0 2)(b 0 3)(x 0 2)(y 0 3)))

(defparameter *funacc* (make-acc (append *0symdef* *fundef*)))
(defparameter *preacc* (make-acc *predef*))
(defparameter *0symacc* (make-acc *0symdef*))

;; do it
(gen-term 15)

(gen-atomic 'p1 3)

