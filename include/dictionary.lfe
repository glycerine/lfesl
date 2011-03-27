(include-file "include/list.lfe")
(include-file "include/thread.lfe")

(defmodule dictionary
  (import
   (rename dict
           ((new 0) dict)
           ((store 3) dict+))))

;; Returns true if the argument is a dictionary
(defun dict?
  (x) (-> (is_tuple x)
          (andalso (=:= 'dict (element 1 x)))))

;; Attempts to marshal the argument into a dictionary
(defun dict!
  ((#()) (dict))
  ((x) (when (is_tuple x))
   (case (element 1 x)
     ('dict x)
     (_ (: dict from_list (list! x)))))
  ((x) (when (is_list x))
   (: dict from_list x)))
