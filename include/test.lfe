;; Record that holds the results of an assertion
(defrecord assertion context expected actual)

;; Creates a record that evaluates expected/actual in a context
(defmacro assert
  ((expected . actual)
   `(make-assertion
     context  *ctx*
     expected ,expected
     actual . ,actual)))

;; Creates a context arround assertions
(defmacro context
  ((ctx . body)
   `(let ((*ctx* (try (: lists concat (list *ctx* '" " ,ctx))
                   (catch ((tuple 'error _ _) ,ctx)))))
      (lc ((<- a (: lists flatten (list . ,body)))
           (=/= (assertion-expected a) (assertion-actual a)))
        a))))

;; defines a test
(defmacro deftest
  ((name . body)
   (let ((test-name (binary_to_atom
                     (iolist_to_binary
                      (: io_lib format '"test-~s" (list name)))
                     'utf8)))
     `(defun ,test-name ()
        (: lists filter
          (lambda (a) (/= () a))
          (: lists flatten (list (context ',name . ,body))))))))
