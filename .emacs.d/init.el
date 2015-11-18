;; -*- coding: utf-8 -*-

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

; list the packages you want
(setq package-list '(evil evil-leader evil-tabs key-chord evil-matchit evil-jumper helm elscreen hl-line+ ))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


; Don't blink the cursor
(blink-cursor-mode 0)

; Refresh updated files (buffers) automatically
(global-auto-revert-mode t)

; No backup files
(setq make-backup-files nil)

; No scroll-bars
(scroll-bar-mode -1)

; Highlight the current line
(global-hl-line-mode 1)

; y or n instead of 'yes or no'
(fset 'yes-or-no-p 'y-or-n-p)


(set-language-environment 'spanish)
(set-terminal-coding-system 'iso-latin-1)


;; Maximize the emacs screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


; Helm configuration
(require 'helm-config)
(require 'helm)

; Constant size of the helm size
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

; Show the current line of the cursor 
(require 'hl-line+)

; Activate Tabs
(require 'elscreen)

; Org configuration
(require 'init-org)

; Evil mode configuration
(require 'init-evil)

; Color theme
;(load-theme 'lush t)
(load-theme 'wombat t)

