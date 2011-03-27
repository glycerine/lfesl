(include-file "include/list.lfe")

(defmodule set
  (import
   (from sets (union 2))
   (rename sets
           ((is_set 1) set?)
           ((new 0) set)
           ((add_element 2) set+))))

;; Attempts to marshal the argument into a set
(defun set!
  ((#()) (set))
  ((x) (when (is_tuple x))
   (case (element 1 x)
     ('set x)
     (_ (set! (list! x)))))
  ((x) (when (is_list x))
   (: sets from_list x)))

;; Set-folds over two set data structures
(defmacro sfold
  ((f acc s) (when (is_atom `,f))
   `(: sets fold (fun ,f 2) ,acc ,s))
  ((f acc s)
   `(: sets fold ,f ,acc ,s)))
