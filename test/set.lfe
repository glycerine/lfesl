(include-file "include/test.lfe")
(include-file "include/thread.lfe")
(include-file "include/set.lfe")

(deftest set!
  (context
   '"should return a set of the contents of a"
   (context '"tuple"
            (assert (set) (set! #()))
            (assert (->> (set) (set+ 'pink) (set+ 'unicorns))
                    (set! #(pink unicorns))))
   (context '"set"
            (assert (set) (set! (set)))
            (assert (set+ 15 (set)) (set! #(15))))
   (context '"dictionary"
            (assert (->> (set) (set+ #(one 1)) (set+ #(two 2)))
                    (set! (: dict from_list '(#(one 1) #(two 2))))))
   (context '"list"
            (assert (->> (set) (set+ 1) (set+ 2) (set+ 3))
                    (set! '(1 2 3))))))

(deftest sfold
  (context
   '"when given an atom fun name, should resolve it to a fun before folding"
   (flet ((lessthan3 (n a) (if (< n 3) (set+ n a) a)))
     (assert (->> (set) (set+ 1) (set+ 0) (set+ 2))
             (sfold lessthan3 (set) (set! '(0 3 4 2 1))))))
  (context
   '"when given a fun, should simple fold the fun over the set"
   (assert (->> (set) (set+ 1) (set+ 0) (set+ 2))
           (sfold (lambda (n a) (if (< n 3) (set+ n a) a))
                  (set)
                  (set! '(0 3 4 2 1))))))

(defun test-set ()
  (test-set!)
  (test-sfold))
