; Clisp has builtin imaginaries (#C(r i)), but we'll implement our own.

(defun mkcomplex (re im) (list :real re :imag im))

(defun re (c) (getf c :real))
(defun im (c) (getf c :imag))

(defun ctos (c) (format nil "~f+~fi" (re c) (im c)))

(defun complex+ (c d) 
  (mkcomplex (+ (re c) (re d)) 
	     (+ (im c) (im d))))

(defun complex* (c d)
  (mkcomplex (- (* (re c) (re d))
		(* (im c) (im d)))
	     (+ (* (re c) (im d))
		(* (im c) (re d)))))

(defun complexmagsqr (c) (let ((r (re c)) (i (im c))) (+ (* r r) (* i i))))

(defun complexinv (c)
  (let ((d (complexmagsqr c)))
    (mkcomplex
      (/ (re c) d)
      (/ (- (im c)) d))))

(defun complex- (c)
  (mkcomplex
    (- (re c)) 
    (- (im c))))

(defun complexconj (c)
  (mkcomplex 
    (re c)
    (- (im c))))

