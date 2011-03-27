(include-file "include/test.lfe")
(include-file "include/boolean.lfe")

(deftest true?
  (context '"should return 'true when the arg exactly evaluates to 'true"
           (assert 'true (true? 'true))
           (assert 'true (true? (== 1 (+ 0 1))))
           (assert 'false (true? 'unicorn))))

(deftest false?
  (context '"should return 'true when the arg exactly evaluates to 'false"
           (assert 'true (false? 'false))
           (assert 'true (false? (== 2 (+ 0 1))))
           (assert 'false (false? 'unicorn))))

(deftest boolean
  (test-true?)
  (test-false?))
