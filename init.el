(package-initialize)
(require 'cl)
(require 'yasnippet)
;; 加载其他配置
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/evil")
(add-to-list 'load-path "~/.emacs.d/lisp/evil-nerd-commenter")
(require 'undo-tree)
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)
(require 'evil-nerd-commenter)
(require 'which-key)
(require 'gnu-elpa-keyring-update)
(require 'init-package)
(require 'init-ui)
(require 'init-better-set)
(require 'init-custom)
(require 'init-key)

;;(setq emacs-load-start-time (current-time))
;;(when (require 'time-date nil t)
  ;;(message "Emacs startup time: %d seconds."
           ;;(time-to-seconds (time-since emacs-load-start-time))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#f4eedb" "#cc1f24" "#778c00" "#a67c00" "#007ec4" "#c42475" "#11948b" "#88999b"])
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#11948b")
 '(cua-overwrite-cursor-color "#a67c00")
 '(cua-read-only-cursor-color "#778c00")
 '(custom-safe-themes
   (quote
    ("00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(evil-leader/leader ",")
 '(fci-rule-color "#f4eedb")
 '(highlight-changes-colors (quote ("#c42475" "#5e65b6")))
 '(highlight-symbol-colors
   (quote
    ("#ec90da49b1e9" "#ccb4e1bdd0ac" "#fb9eca14b38f" "#d89bd3eadcf9" "#de29dee7b293" "#f675cca1ae79" "#d05fdab7e079")))
 '(highlight-symbol-foreground-color "#5d737a")
 '(highlight-tail-colors
   (quote
    (("#f4eedb" . 0)
     ("#a8b84b" . 20)
     ("#66c1b3" . 30)
     ("#6fa5e7" . 50)
     ("#d6a549" . 60)
     ("#ed6e3e" . 70)
     ("#f46495" . 85)
     ("#f4eedb" . 100))))
 '(hl-bg-colors
   (quote
    ("#d6a549" "#ed6e3e" "#ff6243" "#f46495" "#837bdf" "#6fa5e7" "#66c1b3" "#a8b84b")))
 '(hl-fg-colors
   (quote
    ("#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9" "#fffce9")))
 '(hl-paren-colors (quote ("#11948b" "#a67c00" "#007ec4" "#5e65b6" "#778c00")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#cc1f24" "#bb3e06" "#a67c00" "#4f6600" "#a8b84b" "#005797" "#11948b" "#c42475" "#5e65b6")))
 '(package-selected-packages
   (quote
    (elpy all-the-icons rainbow-delimiters evil-ediff solarized-theme wgrep find-file-in-project ace-window evil-leader company swiper counsel smartparens monokai-theme popwin iedit expand-region helm-ag yasnippet auto-yasnippet neotree)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 70)
 '(pos-tip-background-color "#f4eedb")
 '(pos-tip-foreground-color "#5d737a")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#778c00" "#f4eedb" 0.2))
 '(term-default-bg-color "#fffce9")
 '(term-default-fg-color "#596e76")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc1f24")
     (40 . "#bb0159ab189c")
     (60 . "#b11d6bfb0f58")
     (80 . "#a67c00")
     (100 . "#976e81f50000")
     (120 . "#8fd084ae0000")
     (140 . "#87e987410000")
     (160 . "#7faa89b10000")
     (180 . "#778c00")
     (200 . "#690f8e693f47")
     (220 . "#5efe8fb4534a")
     (240 . "#5165910f6634")
     (260 . "#3d37927d78ad")
     (280 . "#11948b")
     (300 . "#1ae68b4ea1e6")
     (320 . "#194086e8ad46")
     (340 . "#127b8279b8a2")
     (360 . "#007ec4"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fffce9" "#f4eedb" "#990001" "#cc1f24" "#4f6600" "#778c00" "#785700" "#a67c00" "#005797" "#007ec4" "#93004d" "#c42475" "#006d68" "#11948b" "#596e76" "#88999b")))
 '(xterm-color-names
   ["#f4eedb" "#cc1f24" "#778c00" "#a67c00" "#007ec4" "#c42475" "#11948b" "#002b37"])
 '(xterm-color-names-bright
   ["#fffce9" "#bb3e06" "#98a6a6" "#88999b" "#596e76" "#5e65b6" "#5d737a" "#00212b"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
