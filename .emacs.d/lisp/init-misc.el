
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

; Set whitespace style in a more reading format
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne
   (tab-mark 9 [9655 9] [92 9]) ; tab
))

(provide 'init-misc)
