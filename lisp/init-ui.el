;全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

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

;; 更改显示字体大小 18pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 180)

;;yes no 简化y n
(fset 'yes-or-no-p 'y-or-n-p)

;;当前行高亮
(global-hl-line-mode t)

;; 选词删除
(delete-selection-mode t)

;; 光标在括号内依然高亮显示
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(provide 'init-ui)
