;;;; quicksys.asd

(asdf:defsystem #:quicksys
    :description "QUICKSYS install systems from multiple Quicklisp distributions"
    :author "Manoel Vilela & Lucas Vieira"
    :license  "MIT"
    :version "0.1.0"
    :homepage "https://github.com/commonlispbr/quicksys"
    :bug-tracker "https://github.com/commonlispbr/quicksys/issues"
    :source-control (:git "https://github.com/commonlispbr/quicksys.git")
    :serial t
    :pathname "src"
    :depends-on (:quicklisp)
    :components ((:file "package")
                 (:file "quicksys")))

(asdf:defsystem #:quicksys/test
  :description "QUICKSYS test suit"
  :author "Manoel Vilela & Lucas Vieira"
  :license  "MIT"
  :version "0.1.0"
  :serial t
  :pathname "t"
  :depends-on (:quicksys :prove)
  :components ((:file "test"))
  :perform (asdf:test-op :after (op c)
                         (funcall (intern #.(string :run) :prove) c)))
