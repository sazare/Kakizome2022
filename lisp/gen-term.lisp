;; gen-term.lisp
;; generate terms


(defun gen-term* (nargs depth)
  "generate term*. assure nargs ~= 0"
  (if (> depth 0)
      (loop for i from 1 to nargs
        collect (gen-term depth)
      )
    (list (choose-symbol *0symacc*))
  )
)


(defun gen-term (depth)
  "generate a term"
  (if (> depth 0)
    (let (fsym nargs)
      (setq fsym (choose-symbol *funacc*))
      (setq nargs (nargsof fsym (append *0symdef* *fundef*)))

      (if (> nargs  0)
        (cons fsym (gen-term* nargs (- depth 1)))
        fsym
      )
    )
    (list (choose-symbol *0symacc*))
  )
)


(defun gen-atomic (psym depth)
  "generate an atomic with psym"
  (if (> depth 0)
    (cons psym (gen-term* (nargsof psym *predef*) (- depth 1)))
    (list psym)
  )
)


