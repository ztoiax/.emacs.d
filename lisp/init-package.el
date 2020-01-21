 (when (>= emacs-major-version 24)
    (require 'package)
    (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                             ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
    ;;(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t))
    ;;(setq package-archives '("melpa"   . "http://mirrors.zilongshanren.com/melpa/")))
     (package-initialize) 

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
                solarized-theme
		popwin
		;; hippie-expand-slime
		;; --- evil ----
		;;evil
		;;evil-leader
		evil-ediff
		neotree
		;; --- text ---
		wgrep
		helm-ag
		iedit
		;; --- other ---
	        expand-region
		yasnippet
		auto-yasnippet
		use-package
		ace-window
		find-file-in-project
		;; --- ui ---
		rainbow-delimiters      ;;彩虹括号
		all-the-icons           ;;图标
		;; --- python ---
		elpy
		;;anaconda-mode 
		;;jedi
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
;;(load-theme 'monokai t)
(load-theme 'solarized-light-high-contrast t)

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
;; 取消单引号成双打印
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; config popwin
(require 'popwin)
(popwin-mode t)

;; evil
(evil-mode 1)

;; evil-leader
(global-evil-leader-mode)

;; evil-surround
(global-evil-surround-mode)

;; evil-nerd-commenter
(evilnc-default-hotkeys)

;; evil-neotree
(setq-default neo-show-hidden-files t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; which-key
(which-key-mode)

;; wgrep

;; rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;    To save buffer automatically when wgrep-finish-edit.

(setq wgrep-auto-save-buffer t)

;;    You can change the default key binding to switch to wgrep.

(setq wgrep-enable-key "r")

;;    To apply all changes wheather or not buffer is read-only.

(setq wgrep-change-readonly-file t)

;; --- python ---
;;elpy
(elpy-enable)
;; anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(provide 'init-package)
