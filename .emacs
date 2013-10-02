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

;; perltidy note: select region; M-1; M-|; perltidy

;; http://blog.tremily.us/posts/Emacs_and_aspell_spelling/
(setq-default ispell-program-name "/usr/local/bin/aspell")

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
;; (require 'magit)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc6e906a0e6ead5747ab2e7c5838166f7350b958d82e410257aeeb2820e8a07a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))

(add-to-list 'load-path "~/.lisp/themes/")
(add-to-list 'custom-theme-load-path "~/.lisp/themes/")
;(load-theme 'zenburn t)
;(load-theme 'solarized-dark t)
;(load-theme 'tango-dark t)
(load-theme 'zenburn t)

;; ***************************************************************
;; IRC stuff
;; ***************************************************************
;;
;; moving this stuff down to see if the nick colors work better here...

(setq erc-keywords '("jzawodn" "jzafk" "jzbrb" "jz" "jzout" "jzlunch" "jzerrand" "jzerrands" "jzfood"))

(and
 (load-library "erc-highlight-nicknames")
 (add-to-list 'erc-modules 'highlight-nicknames)
 (erc-update-modules))

;; From http://www.emacswiki.org/emacs/ErcFilling

(add-hook 'window-configuration-change-hook
		  '(lambda ()
			 (setq erc-fill-column (- (window-width) 2))))
