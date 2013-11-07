(defun confrac (x) 
  (/ 1 (+ 2 x)))

(defun strlen (x) (+ 1 (floor (log x 10))))

(defun sum (x) (reduce '+ x))

(setq frac 0)
(setq N 1000)

(format t "~a~%" (sum (loop repeat N 
      do
	(setq frac (confrac frac))
	(setq v (+ 1 frac))
      collect
	(if (> (strlen (numerator v)) (strlen (denominator v)))
	  1
	  0
	)
)))
