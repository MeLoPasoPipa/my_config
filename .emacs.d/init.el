;; -*- coding: utf-8 -*-

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))


; Install the required packages
(require 'init-install-packages)

; Initialize the basic configuration of emacs
(require 'init-misc)

; Helm configuration
(require 'init-helm)

; Show the current line of the cursor 
(require 'hl-line+)

; Activate Tabs
(require 'elscreen)

; Org configuration
(require 'init-org)

; Evil mode configuration
(require 'init-evil)

; Powerline
(require 'init-powerline)


;(custom-set-faces
; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

; Don't show the startup screen
; Maximize the emacs screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "brown")))))

