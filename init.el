(package-initialize)
(require 'cl)

;; 加载其他配置
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-package)
(require 'init-key)
(require 'init-ui)
(require 'init-better-set)
(require 'init-custom)
