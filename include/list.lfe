(defmodule list
  (import (rename erlang ((is_list 1) list?))))

;; Attempts to marshal the argument into a list
(defun list!
  ((#()) ())
  ((x) (when (is_tuple x))
   (case (element 1 x)
     ('set (: sets to_list x))
     ('dict (: dict to_list x))
     (_ (tuple_to_list x))))
  ((x) (when (is_list x))
   x))

;; Returns the first item in the collection. If coll is nil, returns
;; nil
(defun first (l) (car l))

;; Returns a possibly empty list of the items after the first. Calls
;; list on its argument.
(defun rest (l) (cdr l))

;; Returns a list of the items after the first.  If there are no more
;; items, returns nil.
(defun next (l) (first (rest l)))

;; Same as (first (first l))
(defun ffirst (l) (first (first l)))

;; Same as (next (first l))
(defun nfirst (l) (next (first l)))

;; Same as (first (next l))
(defun second (l) (first (next l)))

;; Same as (first (next l))
(defun fnext (l) (first (next l)))

;; Same as (next (next l))
(defun nnext (l) (next (next l)))

;; Maps a function over a list
(defmacro map
  ((f l) (when (is_atom `,f))
   `(: lists map (fun ,f 1) ,l))
  ((f l)
   `(: lists map ,f ,l)))

;; Sorts the argument the list (with an optional function)
(defmacro sort
  ((l) (when (is_list `,l))
   `(: lists sort ,l))
  ((f l) (when (is_atom `,f))
   `(: lists sort (fun ,f 2) ,l))
  ((f l)
   `(: lists sort ,f ,l)))

;; Folds a function left over a list
(defmacro foldl
  ((f a l) (when (is_atom `,f))
   `(: lists foldl (fun ,f 2) ,a ,l))
  ((f a l)
   `(: lists foldl ,f ,a ,l)))

;; Alias for foldl
(defmacro reduce
  (f a l) `(foldl ,f ,a ,l))
