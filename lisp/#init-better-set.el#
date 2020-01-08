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



;; occur自动选择当前光标位置或选中区域
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; yasnippet
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; mysetting
(defun next-line10()
  "next-line 10"
  (interactive)
  (next-line 10))

(defun previous-line10()
  "previous-line 10"
  (interactive)
  (previous-line 10))

(defun select-current-word ()
  "Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
  (interactive)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (let ((pos (line-beginning-position)))
    (end-of-line)
    (set-mark pos)))

(defun delete-enclosed-text ()
  "Delete texts between any pair of delimiters."
  (interactive)
  (save-excursion
    (let (p1 p2)
      (skip-chars-backward "^([<>“")
      (setq p1 (point))
      (skip-chars-forward "^)]<>”")
      (setq p2 (point))
      (delete-region p1 p2))))


(defun google-translate ()
  "Look up the word under cursor in a browser."
  (interactive)
  (browse-url
   (concat "https://translate.google.cn/?source=osdd#auto|auto|" (thing-at-point 'symbol))))

(defun surround-word (x)
  "Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
  (interactive "sEnter your symbol")
  (let (p1))
  (setq p1 (point))
  (skip-chars-backward "-_A-Za-z0-9")
  (insert x)
  (skip-chars-forward "-_A-Za-z0-9")
  (insert x)
  (goto-char (+ 1 p1)))

(provide 'init-better-set)
