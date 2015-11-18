;; -*- coding: utf-8 -*-
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))


(blink-cursor-mode 0)
;;----------------------------------------------------------------------------
;; Less GC, more memory
;;----------------------------------------------------------------------------
;; By default Emacs will initiate GC every 0.76 MB allocated
;; (gc-cons-threshold == 800000).
;; we increase this to 512MB
;; @see http://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
(setq-default gc-cons-threshold (* 1024 1024 512)
              gc-cons-percentage 0.5)

(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)


; Load Async, helm and projectile
(add-to-list 'load-path "~/git/emacs/async")
(add-to-list 'load-path "~/git/emacs/helm")
(add-to-list 'load-path "~/git/emacs/projectile")

(require 'helm-config)
(require 'helm)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)


; No backup files please
(setq make-backup-files nil)

; No scroll-bars please
(scroll-bar-mode -1)

(require 'hl-line+) ; Show the current line of the cursor 
(require 'elscreen)
;(toggle-hl-line-when-idle 1) 

;(require 'init-modeline)
;(require 'cl-lib)
;(require 'init-compat)
;(require 'init-utils)
;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(add-to-list 'load-path "~/elisp/emms/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)

; AUTOPAIR (create the matching parenthesis automatically)
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers
(setq autopair-autowrap t)

;(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
;(helm-ag-command-option "--all-text")
;(helm-ag-insert-at-point 'symbol)

;(require 'idle-require)
;(require 'init-elpa)
;(require 'init-exec-path) ;; Set up $PATH
;(require 'init-frame-hooks)
;; any file use flyspell should be initialized after init-spelling.el
;; actually, I don't know which major-mode use flyspell.
;(require 'init-spelling)
;(require 'init-xterm)
;(require 'init-gui-frames)
;(require 'init-ido)     ;For listing the buffers and files in the minibuffer
;(require 'init-uniquify)
;(require 'init-flymake)
;(require 'init-helm)
;(require 'init-hippie-expand)
;(require 'init-windows)
;(require 'init-sessions)
;(require 'init-session)
;(require 'init-git)
;(require 'init-crontab)
;(require 'init-markdown)
;(require 'init-erlang)
;(require 'init-javascript)
(require 'init-org)
;(require 'emms-get-lyrics)
;(require 'init-org-mime) ; send org by email
;(require 'init-css
;(require 'init-python-mode)
;(require 'init-haskell)
;(require 'init-ruby-mode)
;(require 'init-lisp)
;(require 'init-elisp)
;(require 'init-yasnippet)

(require 'yasnippet)
(yas-global-mode 1)
;;; Use bookmark instead
;(require 'init-zencoding-mode)
;(require 'init-cc-mode)
;(require 'init-gud)
(require 'init-linum-mode) ; Show the line numbers
;;; (require 'init-gist)
;(require 'init-moz)
;(require 'init-gtags)
;; use evil mode (vi key binding)
;(require 'init-ecb) ; TO FIX
;(require 'init-dired)   ;It shows emacs as a file manager TO TEST
(require 'dired-sort)
;(require 'init-sh)
;(require 'init-ctags)
;(require 'init-ace-jump-mode)
;(require 'init-bbdb)
;(require 'init-gnus)
;(require 'init-lua-mode)
;(require 'init-workgroups2)
;(require 'init-term-mode)
;(require 'init-web-mode)
;(require 'init-slime)
;(require 'init-clipboard)
;(require 'init-company)
;(require 'init-chinese-pyim) ;; cannot be idle-required
;; need statistics of keyfreq asap
;(require 'init-keyfreq)
;(require 'init-httpd)

;; projectile costs 7% startup time
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)

;(require 'helm-descbinds)
;(helm-descbinds-mode)

(require 'init-evil)

(require 'auto-complete-config)
(ac-config-default)

(setq ac-show-menu-immediately-on-auto-complete t)

(require 'epc)

; Python
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; Set to non-nil to point to a particular virtualenv
;(defvar jedi-config:with-virtualenv nil)

;; Variables to help find the project root
;(defvar jedi-config:vsc-root-sentinel ".git")
;(defvar jedi-config:python-module-sentinel "__init__.py")



;; misc has some crucial tools I need immediately
;(require 'init-misc)
(require 'init-color-theme)
;(require 'init-emacs-w3m)

;; {{ idle require other stuff
;(setq idle-require-idle-delay 3)
;(setq idle-require-symbols '(init-misc-lazy
                             ;init-which-func
                             ;init-fonts
                             ;init-hs-minor-mode
                             ;init-stripe-buffer
                             ;init-textile
                             ;init-csv
                             ;init-writting
                             ;init-doxygen
                             ;init-pomodoro
                             ;init-emacspeak
                             ;init-artbollocks-mode
                             ;init-semantic))
;(idle-require-mode 1) ;; starts loading
;; }}

;; Maximize the emacs screen
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(ecb-options-version "2.40")
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time))))

; Highlight the current line
(global-hl-line-mode 1)

; y or n instead of 'yes or no'
(fset 'yes-or-no-p 'y-or-n-p)
(require 'cl)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
;(powerline-evil-vim-color-theme)
(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
(set-face-attribute 'mode-line nil
                    :foreground "Yellow"
                    :background "DarkGreen"
                    :box nil)
;(custom-set-faces
; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

;(display-time-mode t)

(set-language-environment 'spanish)
(set-terminal-coding-system 'iso-latin-1)

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
;(require 'init-locales)

;; my personal setup, other major-mode specific setup need it.
;; It's dependent on init-site-lisp.el
;(if (file-exists-p "~/.custom.el") (load-file "~/.custom.el"))

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(safe-local-variable-values (quote ((lentic-init . lentic-orgel-org-init))))
 ;'(session-use-package t nil (session)))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
;(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
