(include-file "include/test.lfe")
(include-file "include/numeric.lfe")

(deftest zero? (assert 'true (zero? 0)))

(deftest even? (assert 'true (even? 2)))

(deftest odd? (assert 'true (odd? 1)))

(deftest inc
  (assert 2 (inc 1))
  (assert 4.0 (inc 3.0)))

(deftest dec
  (assert 2 (dec 3))
  (assert 4.0 (dec 5.0)))

(deftest numeric
  (test-zero?)
  (test-even?)
  (test-odd?)
  (test-inc)
  (test-dec))
