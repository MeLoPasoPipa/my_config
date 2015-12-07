
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


; Color theme
(load-theme 'flatland t)
;(load-theme 'wombat t)


(provide 'init-misc)
