(include-file "include/test.lfe")
(include-file "include/tuple.lfe")

(deftest tuple!
  (context
   '"should return a tuple of the contents of a"
   (context '"tuple"
            (assert #() (tuple! #()))
            (assert #(pink unicorns) (tuple! #(pink unicorns))))
   (context '"set"
           (assert #() (tuple! (: sets new)))
           (assert #(15) (tuple! (: sets add_element 15 (: sets new)))))
   (context '"dictionary"
           (assert #(#(one 1) #(two 2))
                   (tuple! (: dict from_list '(#(one 1) #(two 2))))))
   (context '"list" (assert #(1 2 3) (tuple! '(1 2 3))))))

(deftest tuple
  (test-tuple!))
