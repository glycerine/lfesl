(include-file "include/test.lfe")

(include-file "test/boolean.lfe")
(include-file "test/numeric.lfe")
(include-file "test/list.lfe")
(include-file "test/tuple.lfe")
(include-file "test/set.lfe")
(include-file "test/dictionary.lfe")
(include-file "test/thread.lfe")

(deftest all
  (test-boolean)
  (test-numeric)
  (test-list)
  (test-tuple)
  (test-set)
  (test-dictionary)
  (test-thread))
