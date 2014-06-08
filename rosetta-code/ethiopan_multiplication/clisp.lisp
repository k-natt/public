
(defun halve  (x) (truncate x 2))
(defun double (x) (* x 2))
(defun iseven (x) (zerop (mod x 2)))

(defun emul (x y) 
  (if (zerop x) 0 (+ (if (iseven x) 0 y)
		     (emul (halve x) 
			   (double y)))))

