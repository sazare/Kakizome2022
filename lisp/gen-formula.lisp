;;; a sample code for gen-formula

; sample
; (defparameter *fundef* '((f1 3 3)(f2 1 6)(f3 4 1)))
; (defparameter *predef* '((p1 1 5)(p2 2 3)(p3 3 1)(p4 4 1)))
; (defparameter *0symdef* '((a 0 2)(b 0 3)(x 0 2)(y 0 3)))

(defun make-acc (def) 
  (loop 
    with acc = 0 and
         tot = (loop for (s1 na dis) in def sum dis)
    for (sym nargs dis) in def
    do (setq acc (+ acc dis))
    collect (list sym  acc)
  )
)

;; play 1

(defun choose-symbol (acc) 
  (let ((r (random (cadar (last acc)))))
     (loop 
      for (sym dist) in acc 
       do (format t "~a ~a : ~a ~%" sym r dist )
         (when (< r dist) (loop-finish))
       finally (return sym)
     )
  )
)


