(include-file "include/test.lfe")
(include-file "include/thread.lfe")
(include-file "include/dictionary.lfe")

(deftest dict?
  (context
   '"should return 'true if the arg is dictionary"
   (assert 'true (dict? (dict)))
   (assert 'true (dict? (dict! '(#(one 1)))))
   (assert 'false (dict? 1))
   (assert 'false (dict? #(unicorns)))))

(deftest dict!
  (context
   '"should return a dictionary of the contents of a"
   (context '"tuple of tuples"
            (assert (dict) (dict! #()))
            (assert (list! (->> (dict) (dict+ 'pink 'unicorns)))
                    (list! (dict! '(#(pink unicorns))))))
   (context '"set of tuples"
            (assert (dict) (dict! (: sets new)))
            (assert (->> (dict) (dict+ 'one 1))
                    (dict! (: sets from_list '(#(one 1))))))
   (context '"dictionary"
            (assert (->> (dict) (dict+ 'one 1) (dict+ 'two 2))
                    (dict! (: dict from_list '(#(one 1) #(two 2))))))
   (context '"list of tuples"
            (assert (->> (dict) (dict+ 'one 1) (dict+ 'two 2) (dict+ 'three 3))
                    (dict! '(#(one 1) #(two 2) #(three 3)))))))

(deftest dictionary
  (test-dict?)
  (test-dict!))
