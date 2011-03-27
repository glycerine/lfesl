(include-file "include/test.lfe")
(include-file "include/list.lfe")

(deftest list!
  (context
   '"should return a list of the contents of a"
   (context '"tuple"
            (assert () (list! #()))
            (assert '(pink unicorns) (list! #(pink unicorns))))
   (context '"set"
            (assert () (list! (: sets new)))
            (assert '(15) (list! #(15))))
   (context '"dictionary"
            (assert '(#(one 1) #(two 2))
                    (list! (: dict from_list '(#(one 1) #(two 2))))))
   (context '"list" (assert '(1 2 3) (list! '(1 2 3))))))

(deftest first
  (context '"should return the head of the list (alias for car)"
           (assert 1 (first '(1)))))

(deftest rest
  (context '"should return the tail of the list (alias for cdr)"
           (assert () (rest '(1)))
           (assert '(2) (rest '(1 2)))))

(deftest next
  (context '"should return the head of the tail of the list"
           (assert 2 (next '(1 2 3)))))

(deftest ffirst
  (context '"should return the first of the first of the list"
           (assert 1 (ffirst '((1 2) (3 4))))))

(deftest nfirst
  (context '"should return the next of the first of the list"
           (assert 2 (nfirst '((1 2) (3 4))))))

(deftest second
  (context '"should return the same as fnext"
           (assert (fnext '((1 2) (3 4))) (second '((1 2) (3 4))))))

(deftest fnext
  (context '"should return the first of the next of the list"
           (assert 3 (fnext '((1 2) (3 4))))))

(deftest nnext
  (context '"should return the next of the next of the list"
           (assert 4 (nnext '((1 2) (3 4))))))

(deftest map
  (context
   '"when given an atom fun name, should resolve it to a fun before map"
   (flet ((increment-by-2 (n) (+ n 2)))
     (assert '(2 3 4) (map increment-by-2 '(0 1 2)))))
  (context
   '"when given a fun, should simple map the fun over the list"
   (assert '(2 3 4) (map (lambda (n) (+ n 2)) '(0 1 2)))))

(deftest sort
  (context
   '"when given an atom fun name, should resolve it to a fun before sort"
   (flet ((reverse-sort (n1 n2) (> n1 n2)))
     (assert '(9 8 7) (sort reverse-sort '(7 9 8)))))
  (context
   '"when given a fun, should sort over the list with the fun"
   (assert '(x y y z) (sort (lambda (a b) (=< a b)) '(y z y x))))
  (context
   '"when not given a fun, should sort in regular accending order"
   (assert '(0 1 2 3 4 5 6 7 8 9) (sort '(9 8 7 6 5 4 3 2 1 0)))
   (assert '(a b c d e f g h i) (sort '(e d f c g b h a i)))))

(deftest foldl
  (context
   '"when given an atom fun name, should resolve it to a fun before foldl"
   (flet ((sum-up (n a) (+ n a)))
     (let ((data '(0 1 2 3 4 5))
           (start 0)
           (expected 15))
       (assert expected (foldl sum-up start data))
       (assert expected (reduce sum-up start data)))))
  (context
   '"when given a fun, should simple foldl the fun over the list"
   (assert 6 (foldl (lambda (n a) (- a n)) 10 '(0 1 2 1)))))

(deftest list
  (test-list!)
  (test-first)
  (test-rest)
  (test-next)
  (test-ffirst)
  (test-fnext)
  (test-second)
  (test-nfirst)
  (test-nnext)
  (test-map)
  (test-sort)
  (test-foldl))
