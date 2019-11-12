;;Record startup timestamp
(defvar mt/invokation-time
  (current-time))

;;Define base-path
(defvar mt/base-path
  (file-name-directory load-file-name))

(defun mt/load-file (file-path)
  "Loads the specified file and also it's customized version, if it exists"
  (load (concat mt/base-path
                file-path))
  (load (concat mt/base-path
                file-path
                "-custom")
        t))

;;Load lib.el
(mt/load-file "lib")
