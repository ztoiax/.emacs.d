(package-initialize)

(require 'cl)

;; 加载其他配置
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-package)
(require 'init-key)
(require 'init-ui)
(require 'init-custom)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 打开最近关闭文件
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-item 10)
;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)
 
;; 取消文件备份
(setq make-backup-files nil)

;; 选项保存
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 宏
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; test
					    ("8zl" "test")
					    ))

;; 全局buffer缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; hippie补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

