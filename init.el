(package-initialize)

 (require 'cl)


;; 加载其他配置
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-package)
(require 'init-key)
(require 'init-custom)

;;全屏
(setq inhibit-splash-screen t)

;;关闭声音
(setq ring-bell-function 'ignore)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
;;(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 打开最近关闭文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)
 
;; 取消文件备份
(setq make-backup-files nil)

;; 选词删除
(delete-selection-mode t)

;; 选项保存
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;当前行高亮
(global-hl-line-mode t)

;; 宏
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; test
					    ("8zl" "test")
					    ))
