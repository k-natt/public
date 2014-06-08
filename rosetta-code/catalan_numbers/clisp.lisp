
(defun fact (x) (if (< x 2) 1 (* x (fact (- x 1)))))

(defun cat (n)
  (/ (fact (* 2 n))
     (* (fact (+ n 1))
	(fact n))))

(defun test ()
  (loop for i upto 15 do
	(format t "~2d:~10d~%" i (cat i))))

