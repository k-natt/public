;(defun pow (x y) (if (zerop y) 1 (* x (pow x (- y 1)))))

(defun pow (x y)
  (if (zerop y)
    1 
    (if (evenp y) 
      (pow (* x x) (/ y 2)) 
      (* x (pow x (- y 1))))))
