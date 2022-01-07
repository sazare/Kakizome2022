;;; a sample code for gen-symbol

(in-package :genexp)

; sample
; (defparameter *fundef* '((f1 3 3)(f2 1 6)(f3 4 1)))
; (defparameter *predef* '((p1 1 5)(p2 2 3)(p3 3 1)(p4 4 1)))
; (defparameter *0symdef* '((a 0 2)(b 0 3)(x 0 2)(y 0 3)))


(defun make-acc (def) 
  "make acc from def"
  (loop 
    with acc = 0 and
         tot = (loop for (s1 na dis) in def sum dis)
    for (sym nargs dis) in def
    do (setq acc (+ acc dis))
    collect (list sym (/ acc tot))
  )
)

(defun nargsof (sym def)
  (cadr (assoc sym def))
) 

(defun choose-symbol (acc) 
  "choose a symbol from acc"
  (let ((r (random 1.0d0)))
     (loop 
      for (sym prob) in acc 
       do ;(format t "~a ~a : ~a ~%" sym r prob)
         (when (< r prob) (loop-finish))
       finally (return sym)
     )
  )
)


