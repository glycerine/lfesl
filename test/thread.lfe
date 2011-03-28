(include-file "include/test.lfe")
(include-file "include/thread.lfe")

(deftest ->
  (context
   '"with any arg that is not a list should create a list from the arg"
   (assert '(2 1) (-> 1 2))
   (assert '(2 (7 #((5 (1))))) (-> 1 (list) 5 (tuple) 7 2)))
  (context
   '"with exactly 1 arg should evaluate to the arg"
   (assert 1 (-> 1))
   (assert 2 (-> (+ 1 1))))
  (context
   '"with >1 args should thread each sexp as the 2nd arg to the next"
   (assert #(8.0) (-> 2 (/ 1) (* 4) (tuple)))))

(deftest ->>
  (context
   '"with any arg that is not a list should create a list from the arg"
   (assert '(2 1) (->> 1 2))
   (assert '(2 (7 #((5 (1))))) (->> 1 (list) 5 (tuple) 7 2)))
  (context
   '"with exactly 1 arg should evaluate to the arg"
   (assert 1 (->> 1))
   (assert 2 (->> (+ 1 1))))
  (context
   '"with >1 args should thread each sexp as the last arg to the next"
   (assert #(2.0) (->> 2 (/ 1) (* 4) (tuple)))))

(deftest thread
  (test-->)
  (test-->>))
