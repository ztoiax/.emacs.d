;; mode
(winner-mode t)
(winum-mode t)
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

;; chen
;; ,w2
(defun my-split-window-horizontally (&optional ratio)
  "Split window horizontally and resize the new window.
'C-u number M-x my-split-window-horizontally' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-horizontally (floor (/ (window-body-width)
                                           (1+ ratio-val)))))
     (t
      (split-window-horizontally)))
    (set-window-buffer (next-window) (current-buffer))
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-right))))
;; ,w3
(defun my-split-window-vertically (&optional ratio)
  "Split window vertically and resize the new window.
'C-u number M-x my-split-window-vertically' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-vertically (floor (/ (window-body-height)
                                         (1+ ratio-val)))))
     (t
      (split-window-vertically)))
    ;; open another window with current-buffer
    (set-window-buffer (next-window) (current-buffer))
    ;; move focus if new window bigger than current one
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-down))))
;; ,sh
(defun my-switch-to-shell ()
  "Switch to built in or 3rd party shell."
  (interactive)
  (cond
   ((display-graphic-p)
    (switch-to-builtin-shell))
   (t
    (suspend-frame))))

;; ,fr
(defun my-counsel-recentf (&optional n)
  "Find a file on `recentf-list'.
If N is not nil, only list files in current project."
  (interactive "P")
  (unless (featurep 'recentf) (require 'recentf))
  (recentf-mode 1)
  (let* ((files (mapcar #'substring-no-properties recentf-list))
         (root-dir (if (ffip-project-root) (file-truename (ffip-project-root)))))
    (when (and n root-dir)
      (setq files (delq nil (mapcar (lambda (f) (path-in-directory-p f root-dir)) files))))
    (ivy-read "Recentf: "
              files
              :initial-input (if (region-active-p) (my-selected-str))
              :action (lambda (f)
                        (with-ivy-window
                          (find-file f)))
              :caller 'counsel-recentf)))

;; ,fd
(defvar my-dired-directory-history nil "Recent directories accessed by dired.")

(defun counsel-recent-directory (&optional n)
  "Goto recent directories.
If N is not nil, only list directories in current project."
  (interactive "P")
  (unless recentf-mode (recentf-mode 1))
  (let* ((cands (delete-dups
                 (append my-dired-directory-history
                         (mapcar 'file-name-directory recentf-list)
                         ;; fasd history
                         (if (executable-find "fasd")
                             (nonempty-lines (shell-command-to-string "fasd -ld"))))))
         (root-dir (if (ffip-project-root) (file-truename (ffip-project-root)))))
    (when (and n root-dir)
      (setq cands (delq nil (mapcar (lambda (f) (path-in-directory-p f root-dir)) cands))))
    (ivy-read "directories:" cands :action 'dired)))

;; ,rt

(defun pickup-random-color-theme (themes)
  "Pickup random color theme from themes."
  (unless (featurep 'counsel) (require 'counsel))
  (let* ((available-themes (mapcar 'symbol-name themes))
         (theme (nth (random (length available-themes)) available-themes)))
    (counsel-load-theme-action theme)
    (message "Color theme [%s] loaded." theme)))

(defun random-color-theme ()
  "Random color theme."
  (interactive)
  (pickup-random-color-theme (custom-available-themes)))

(defun random-healthy-color-theme (join-dark-side)
  "Random healthy color theme.
When join-dark-side is t, pick up dark theme only."
  (interactive "P")
  (let* (themes
         (hour (string-to-number (format-time-string "%H" (current-time))))
         (prefer-light-p (and (not join-dark-side) (>= hour 9) (<= hour 19)) ))
    (dolist (theme (custom-available-themes))
      (let* ((light-theme-p (string-match-p "-light" (symbol-name theme))))
        (when (if prefer-light-p light-theme-p (not light-theme-p))
          (push theme themes))))
  (pickup-random-color-theme themes)))

(provide 'init-better-set)
