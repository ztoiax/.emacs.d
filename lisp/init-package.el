 (when (>= emacs-major-version 24)
   (require 'package)
     (package-initialize)
     ;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ;("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
     (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t))

;; 注意 elpa.emacs-china.org 是Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
		company
		swiper
                ;; --- Better Editor ---
                ;;hungry-delete
                counsel
                smartparens
                ;; --- Major Mode ---
                ;;js2-mode
                ;; --- Minor Mode ---
                ;;nodejs-repl
                ;;exec-path-from-shell
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
		popwin
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

;; 主题
(load-theme 'monokai t)

;; 开启全局 Company 补全
(global-company-mode 1)

;; config swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)


;; config smartparens
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; config popwin
(require 'popwin)
(popwin-mode t)

(provide 'init-package)
