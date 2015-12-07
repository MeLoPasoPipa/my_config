
; Change the line
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;(require 'powerline)
;(powerline-evil-theme)
(require 'powerline-evil)
(powerline-evil-center-color-theme)

(setq powerline-evil 'arrow)   ;; the default

(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
(set-face-attribute 'mode-line nil
                    :foreground "Yellow"
                    :background "DarkGreen"
                    :box nil)

(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

(provide 'init-powerline)
