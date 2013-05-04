(add-to-list 'load-path "~/.lisp/")

(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'replace-string)

(setq-default transient-mark-mode t)
(setq-default indent-tabs-mode nil)

;; ***************************************************************
;; Basic Modes and Editing
;; ***************************************************************

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(font-lock-mode)

;; ***************************************************************
;; My frame setup...
;; ***************************************************************

;; (setq default-frame-alist
;;       '((cursor-color . "yellow")
;;         (cursor-type . box)
;;         (foreground-color . "grey")
;;         (background-color . "black")
;;         ))

;(add-to-list 'default-frame-alist '(font . "Inconsolata-10"))
;(add-to-list 'default-frame-alist '(font . "Inconsolata-12"))
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

;; make scrolling suck less

(setq
 scroll-margin 0                  
 scroll-preserve-screen-position 1)

;; ***************************************************************
;; IRC stuff
;; ***************************************************************

;; (setq erc-keywords '("jzawodn" "jzafk" "jzbrb" "jz" "jzout" "jzlunch" "jzerrand" "jzerrands" "jzfood"))

;; (and
;;  (load-library "erc-highlight-nicknames")
;;  (add-to-list 'erc-modules 'highlight-nicknames)
;;  (erc-update-modules))

;; From http://www.emacswiki.org/emacs/ErcFilling

(add-hook 'window-configuration-change-hook 
		  '(lambda ()
			 (setq erc-fill-column (- (window-width) 2))))

;; Org Mode

;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)

;; Markdown

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Mac mucking
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;(setq mac-allow-anti-aliasing nil)

;; Mail
;;
;; See: http://www.gnu.org/software/emacs/manual/html_node/smtpmail/Emacs-Speaks-SMTP.html

;; If you use the default mail user agent.
(setq send-mail-function 'smtpmail-send-it)
;; If you use Message or Gnus.
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "home.craigslist.org")
(setq smtpmail-smtp-service 25)

(setq iswitchb-mode t)
(setq linum-mode 1)

(add-hook 'cperl-mode-hook
		  (lambda() (linum-mode 1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))

;; perltidy note: select region; M-1; M-|; perltidy

;; http://blog.tremily.us/posts/Emacs_and_aspell_spelling/
(setq-default ispell-program-name "/usr/local/bin/aspell")

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
;; (require 'magit)


;; http://code.google.com/p/emacs-nav/
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
;; (global-set-key [f8] 'nav-toggle)

;; prelude stuff
;(defvar prelude-dir "~/.emacs.d/")
;(load-file (concat prelude-dir "init.el"))
;(require 'zenburn-theme)

;(require 'tomorrow-theme)
(put 'narrow-to-region 'disabled nil)

;; setup C-c t for ansi-term shortcut
;;
;; http://emacsredux.com/blog/2013/03/29/terminal-at-your-fingertips/

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-set-key (kbd "C-c t") 'visit-term-buffer)
