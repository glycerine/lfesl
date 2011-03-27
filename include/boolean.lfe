;; Returns true if x is the value false, false otherwise.
(defun false? (x) (=:= x 'false))

;; Returns true if x is the value true, false otherwise.
(defun true? (x) (=:= x 'true))
