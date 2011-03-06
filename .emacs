(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'replace-string)

(setq-default transient-mark-mode t)

;; ***************************************************************
;; Basic Modes and Editing
;; ***************************************************************

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(font-lock-mode)

;; ***************************************************************
;; My frame setup...dry roasted & lightly salted Macadamia nuts
;; ***************************************************************

(setq default-frame-alist
      '((cursor-color . "yellow")
        (cursor-type . box)
        (foreground-color . "grey")
        (background-color . "black")
        ))

;(add-to-list 'default-frame-alist '(font . "Inconsolata-10"))
(add-to-list 'default-frame-alist '(font . "Inconsolata-12"))
;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
;(add-to-list 'default-frame-alist '(font . "Monospace-10"))
;;(add-to-list 'default-frame-alist '(font . "Terminus-12"))
;(add-to-list 'default-frame-alist '(font . "Terminus-9"))
;(add-to-list 'default-frame-alist '(font . "Terminus-10"))
;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
;(add-to-list 'default-frame-alist '(font . "Envy Code R-12"))

(setq default-tab-width 4
	  cperl-close-paren-offset -4
	  cperl-continued-statement-offset 4
	  cperl-indent-parens-as-block t
	  cperl-tab-always-indent t)

(require 'tramp)
(setq tramp-default-method "scp")

;; ***************************************************************
;; cperl-mode
;; ***************************************************************

(setq cperl-indent-level 4)
(defalias 'perl-mode 'cperl-mode)
;(setq-default indent-tabs-mode nil)

;; other
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(column-number-mode 1)
;(desktop-save-mode 1)

;; make scrolling suck less

(setq
 scroll-margin 0                  
 scroll-preserve-screen-position 1)

;; ***************************************************************
;; IRC stuff
;; ***************************************************************

(setq erc-keywords '("jzawodn" "jzafk" "jzbrb" "jz" "jzlunch" "jzerrand" "jzerrands"))

;; Markdown

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
	  (cons '("\\.text" . markdown-mode) auto-mode-alist))
