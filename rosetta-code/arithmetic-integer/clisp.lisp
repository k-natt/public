(defun pall (a b)
  (format t "Sum: ~d~%Diff: ~d~%Prod: ~d~%Div: ~d~%Rem: ~d"
	  (+ a b)
	  (- a b)
	  (* a b)
	  (truncate a b)
	  (rem a b)))

