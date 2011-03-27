(defmodule numeric
  (import
   (rename erlang
           ((bnot 2) bit-not)
           ((band 2) bit-and)
           ((bor 2) bit-or)
           ((bxor 2) bit-xor)
           ((bsl 1) bit-shift-left)
           ((bsr 1) bit-shift-right))))

;; Returns true if num is zero, else false
(defun zero? (n) (== 0 n))

;; Returns true if n is even
(defun even? (n) (zero? (band 1 n)))

;; Returns true if n is odd
(defun odd? (n) (not (even? n)))

;; Increments n by 1
(defun inc (n) (+ n 1))

;; Decrements n by 1
(defun dec (n) (- n 1))
