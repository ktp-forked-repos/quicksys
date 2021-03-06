(ql:quickload '(:prove) :silent t)
(eval-when (:load-toplevel :execute)
  (pushnew (truename (sb-unix:posix-getcwd/))
           ql:*local-project-directories*)
  (ql:register-local-projects)
  (ql:quickload :quicksys/test :silent t)
  (setf prove:*enable-colors* t)
  (if (prove:run "t/test.lisp")
      (sb-ext:exit :code 0)
      (sb-ext:exit :code 1)))
