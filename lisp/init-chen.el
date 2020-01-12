
(defun my-switch-to-shell ()
  "Switch to built in or 3rd party shell."
  (interactive)
  (cond
   ((display-graphic-p)
    (switch-to-builtin-shell))
   (t
    (suspend-frame))))
;; ,fr
(defun ffip-project-root ()
  "Return project root or `default-directory'."
  (let* ((project-root (or ffip-project-root
                           (cond
                            ((functionp ffip-project-root-function)
                             (funcall ffip-project-root-function))
                            ((listp ffip-project-file)
                             (ffip--some (apply-partially 'locate-dominating-file
                                                          default-directory)
                                         ffip-project-file))
                            (t
                             (locate-dominating-file default-directory
                                                     ffip-project-file))))))
    (or (and project-root (file-name-as-directory project-root))
        default-directory)))

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
;;,w2
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

;;,w3
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

;;,wc
(defun ace-swap-window ()
  "Ace swap window."
  (interactive)
  (aw-select " Ace - Swap Window"
             #'aw-swap-window))

(provide 'init-chen)