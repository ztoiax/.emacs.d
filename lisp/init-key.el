;; 这一行代码，将函数 open-init-file 绑定到 <f10>
(global-set-key (kbd "<f10>") 'open-init-file)
(global-set-key (kbd "<escape>") 'keyboard-quit)
;; company C-n C-p选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; smartparens
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; config swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; git find file
(global-set-key (kbd "C-c f") 'counsel-git)

;; 全局buffer缩进
(global-set-key (kbd "C-M-z") 'indent-region-or-buffer)

;; hippie补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; occur
(global-set-key (kbd "C-M-o") 'occur-dwim)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; auto-yasnippet
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)


;; evil
(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

;;evil-leader
(evil-leader/set-key
 "ff" 'find-file
 "bb" 'switch-to-buffer
 "0"  'select-windo
 "1"  'select-window-1
 "2"  'select-window-2
 "3"  'select-window-3
 "bn" 'other-window
 "e"  'eval-last-sexp
 "u"  'universal-argument
 "ww" 'save-buffer
 "wl" 'split-window-right
 "wj" 'split-window-below
 "wd" 'delete-other-windows
 ;; neotree
 "t"  'neotree-toggle
 ;; iedit编辑多区域
 "i"  'iedit-mode 
 ;; ag
 "ag" 'helm-do-ag-project-root
 )

;; evil-nerd-commenter注释
(define-key evil-normal-state-map (kbd "gcc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "gcc") 'evilnc-comment-or-uncomment-lines)

;; mysetting
(global-set-key (kbd "C-M-n") 'next-line10)
(global-set-key (kbd "C-M-p") 'previous-line10)

(global-set-key (kbd "C-M-w") 'select-current-word)
(global-set-key (kbd "C-.") 'select-current-line)
(global-set-key (kbd "C-' C-d") 'delete-enclsed-text)

(global-set-key (kbd "C-' C-t") 'google-translate)

(global-set-key (kbd "C-M-y") 'surround-word)
(provide 'init-key)
