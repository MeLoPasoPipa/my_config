
(require 'helm-config)
(require 'helm)

; Constant size of the helm size
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

(provide 'init-helm)
