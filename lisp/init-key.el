;; 这一行代码，将函数 open-init-file 绑定到 <f10>
(global-set-key (kbd "<f10>") 'open-init-file)

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

(provide 'init-key)
