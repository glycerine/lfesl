(defmodule tuple
  (import (rename erlang ((is_tuple 1) tuple?))))

;; Attempts to marshal the argument into a tuple
(defun tuple!
  ((#()) #())
  ((x) (when (is_tuple x))
   (case (element 1 x)
     ('set (list_to_tuple (: sets to_list x)))
     ('dict (list_to_tuple (: dict to_list x)))
     (_ x)))
  ((x) (when (is_list x))
   (list_to_tuple x)))
