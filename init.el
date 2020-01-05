(package-initialize)
(require 'cl)
(require 'yasnippet)
;; 加载其他配置
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-package)
(require 'init-key)
(require 'init-ui)
(require 'init-better-set)
(require 'init-custom)

;; (load-file 'undo-tree.el)

(set package-check-signature nil)
