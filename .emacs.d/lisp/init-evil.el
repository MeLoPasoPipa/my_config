


(global-set-key (kbd "<f1>") (lambda() (interactive)(describe-mode)))
(global-set-key (kbd "<f2>") (lambda() (interactive)(describe-minor-mode)))
(global-set-key (kbd "<f8>") (lambda() (interactive)(list-packages)))
(global-set-key (kbd "<f9>") (lambda() (interactive)(find-file "~/.emacs.d/lisp/init-evil.el")))
(global-set-key (kbd "<f10>") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f11>") (lambda() (interactive)(find-file "~/TODO/org_test.org")))


(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "e" 'pp-eval-last-sexp) ; executes the lisp command under the cursor (equivalent to C-c C-e) 
(evil-leader/set-key "s" 'session-save)
(evil-leader/set-key "l" 'session-load)
(evil-leader/set-key "d" 'dired-jump) ; Open dired in the folder of the current buffer
(evil-leader/set-key "u" 'undo-tree-visualize)

; HELM movement
(define-key evil-normal-state-map (kbd "C-ñ") 'helm-mini)
(define-key evil-normal-state-map (kbd "C-m") 'helm-M-x)

(define-key evil-normal-state-map (kbd "C-p") 'projectile-commander)

(define-key helm-map (kbd "M-j") 'helm-next-line)
(define-key helm-map (kbd "M-k") 'helm-previous-line)
(define-key helm-map (kbd "M-l") 'helm-next-source)
(define-key helm-map (kbd "M-h") 'helm-previous-source)

;(dolist (key '(
;               "\C-z" ))
;  (global-unset-key key))
;
;(setq evil-toggle-key (kbd "C-e"))

;; Go to next link in help mode using TAB
(evil-define-key 'motion help-mode-map [tab] 'forward-button)

; COLORS OF THE CURSOR
;; Set colors depending on the evil-state-cursor
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("brown" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("blue" bar))
(setq evil-replace-state-cursor '("violet" bar))
(setq evil-operator-state-cursor '("red" hollow))

; WINDOWS
;; Move through windows in an easy way
(define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)
;(define-key evil-normal-state-map [tab] 'other-window)

; Create (split) and delete windows
(evil-leader/set-key "h"  (lambda () (interactive) (split-window-vertically) (balance-windows)))
(evil-leader/set-key "v"  (lambda () (interactive) (split-window-horizontally) (balance-windows)))



; MOVING
;; Move through tabs in an easy way
(define-key evil-normal-state-map (kbd "C-j") 'elscreen-previous) ;previous tab
(define-key evil-insert-state-map (kbd "C-j") 'elscreen-previous)
(define-key evil-normal-state-map (kbd "C-k") 'elscreen-next) ;next tab
(define-key evil-insert-state-map (kbd "C-k") 'elscreen-next)

;; Move through buffers in an easy way
(define-key evil-normal-state-map (kbd "C-h") 'evil-prev-buffer)
(define-key evil-normal-state-map (kbd "C-l") 'evil-next-buffer)

; Adapt Control-U to the usual vim behaviour (scroll up)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(define-key evil-normal-state-map (kbd "C-,") 'switch-to-previous-buffer)

(define-key evil-normal-state-map (kbd "C-d") 'dired-jump-other-window)
;(evil-define-key 'normal dired-mode-map "C-m" 'helm-M-x)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(define-key evil-normal-state-map (kbd "C-,") 'switch-to-previous-buffer)


; TABS
; ElScreen is the tabs of emacs (evil-tabs-mode)
(load "elscreen" "ElScreen" t)

(global-evil-tabs-mode t)

;; Create and delete tabs
(evil-leader/set-key "t" 'elscreen-create)
(evil-leader/set-key "k" 'elscreen-kill)
(evil-leader/set-key "q" 'kill-this-buffer)
;(key-chord-define evil-normal-state-map "aa" 'evil-quit)

; BUFFERS
(evil-leader/set-key "b" 'helm-buffers-list)



;; Save and delete buffers
(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "d" 'delete-window)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "q" 'kill-buffer-and-window)


; HELP
(evil-leader/set-key "y" 'helm-all-mark-rings)
(evil-leader/set-key "h" 'helm-apropos)

; FILES
;(evil-leader/set-key "f" 'helm-for-files)
(evil-leader/set-key "f" 'helm-find-files)


(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
           (evil-scroll-line-to-center (line-number-at-pos)))

; MOVEMENT OF THE CURSOR
;; Make movement keys work like they should = Move through lines as it should be (emulate j=gj and k=gk of vim)
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines                                    
(setq-default evil-cross-lines t)

; key-chord  
(require 'key-chord)
(setq key-chord-two-keys-delay 0.1)

; ESCAPING
;; Easy escape back to the normal state (kj for everything)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)
(key-chord-define evil-visual-state-map "kj" 'evil-normal-state)
(key-chord-define minibuffer-local-map "kj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-ns-map "kj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-completion-map "kj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-must-match-map "kj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-filename-completion-map "kj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-filename-must-match-map "kj"  'keyboard-escape-quit)

;TODO command-mode-map
;; Easy exiting while searching (press 'kj' quickly and it will cancel the search)
(defun isearch-exit-chord-worker (&optional arg)
  (interactive "p")
  (execute-kbd-macro (kbd "<backspace> <return>")))

(defun isearch-exit-chord (arg)
  (interactive "p")
  (isearch-printing-char)
  (unless (fboundp 'smartrep-read-event-loop)
    (require 'smartrep))
  (run-at-time 0.1 nil 'keyboard-quit)
  (condition-case e
    (smartrep-read-event-loop
      '(("k" . isearch-exit-chord-worker)
         ("j" . isearch-exit-chord-worker)))
    (quit nil)))

;; example bindings
(define-key isearch-mode-map "j" 'isearch-exit-chord)
(define-key isearch-mode-map "k" 'isearch-exit-chord)

(key-chord-mode 1)

; Search

(key-chord-define evil-normal-state-map "ag" 'helm-ag)

; MINIBUFFER

;(define-key evil-normal-state-map  "sd" 'smex)
;(define-key evil-normal-state-map  "SD" 'smex-major-mode-commands)

;; Set initial states of the evil mode
(cl-loop for (mode . state) in '(
                            ;(inferior-emacs-lisp-mode . emacs)
                            ;(nrepl-mode . insert)
                            ;(pylookup-mode . emacs)
                            ;(comint-mode . normal)
                            (shell-mode . insert)
                            (package-menu-mode . normal)
                            ;(git-commit-mode . insert)
                            ;(git-rebase-mode . emacs)
                            ;(term-mode . emacs)
                            (help-mode . normal)
                            ;(helm-grep-mode . emacs)
                            ;(grep-mode . emacs)
                            ;(bc-menu-mode . emacs)
                            ;(magit-branch-manager-mode . emacs)
                            ;(rdictcc-buffer-mode . emacs)
                            (dired-mode . normal)
                            ;(wdired-mode . normal)
                            (ibuffer-mode . normal)
                            )
    do (evil-set-initial-state mode state))

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(eval-after-load 'ibuffer
                 '(progn
                    (evil-define-key 'normal ibuffer-mode-map
                                     (kbd "m") 'ibuffer-mark-forward
                                     (kbd "t") 'ibuffer-toggle-marks
                                     (kbd "u") 'ibuffer-unmark-forward
                                     (kbd "=") 'ibuffer-diff-with-file
                                     (kbd ";") 'ibuffer-do-isearch
                                     (kbd "-") 'ibuffer-do-isearch-regexp
                                     (kbd "J") 'ibuffer-jump-to-buffer
                                     (kbd "j") 'evil-next-line
                                     (kbd "k") 'evil-previous-line
                                     (kbd "l") 'ibuffer-visit-buffer-other-window
                                     (kbd "L") 'ibuffer-visit-buffer
                                     (kbd "r") 'ibuffer-update
                                     )
                    )
                 )

;(use-package magit
;  :ensure magit
;  :config
;  (progn
;    (evil-set-initial-state 'magit-mode 'normal)
;    (evil-set-initial-state 'magit-status-mode 'normal)
;    (evil-set-initial-state 'magit-diff-mode 'normal)
;    (evil-set-initial-state 'magit-log-mode 'normal)
;    (evil-define-key 'normal magit-mode-map
;        "j" 'magit-goto-next-section
;        "k" 'magit-goto-previous-section)
;    (evil-define-key 'normal magit-log-mode-map
;        "j" 'magit-goto-next-section
;        "k" 'magit-goto-previous-section)
;    (evil-define-key 'normal magit-diff-mode-map
;        "j" 'magit-goto-next-section
;        "k" 'magit-goto-previous-section)))
;
; Use search with ',' (as the char '/' in the spanish keyboard is located very far)
(define-key evil-normal-state-map "," 'evil-search-forward)
;(define-key evil-normal-state-map " " 'evil-ex)

;; MATCHIT: Go to if-else using %
(require 'evil-matchit)
(global-evil-matchit-mode 1)

; SEARCHING
; nnoremap n nzz -> Show in the middle of the screen the searched string (BUG: If the string is already in the same screen, it does NOT put it in the middle)
(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "bsd")

;; evil-jumper
(require 'evil-jumper)
(global-evil-jumper-mode)

; YANK
;; 'Y' = copy to end of line
(defun copy-to-end-of-line ()
  (interactive)
  (evil-yank (point) (point-at-eol)))
(define-key evil-normal-state-map "Y" 'copy-to-end-of-line)


; VISUAL
; Select last yanked text
(evil-leader/set-key "V" 'exchange-point-and-mark)

; RETurn definition
;(define-key global-map (kbd "RET") 'newline-and-indent)
;(evil-declare-key 'motion completion-list-mode-map (kbd "<return>") 'choose-completion)
;(evil-declare-key 'motion completion-list-mode-map (kbd "RET") 'choose-completion)
;(evil-declare-key 'motion browse-kill-ring-mode-map (kbd "<return>") 'browse-kill-ring-insert-and-quit)
;(evil-declare-key 'motion browse-kill-ring-mode-map (kbd "RET") 'browse-kill-ring-insert-and-quit)
;(evil-declare-key 'motion occur-mode-map (kbd "<return>") 'occur-mode-goto-occurrence)
;(evil-declare-key 'motion occur-mode-map (kbd "RET") 'occur-mode-goto-occurrence)

; It is useful to remove them from evil-motion-state-map so as when modes define them, RET and SPC bindings are available directly.
;(defun my-move-key (keymap-from keymap-to key)
;  "Moves key binding from one keymap to another, deleting from the old location. "
;  (define-key keymap-to key (lookup-key keymap-from key))
;  (define-key keymap-from key nil))
;(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
;(my-move-key evil-motion-state-map evil-normal-state-map " ")


(evil-define-key 'normal python-mode-map (kbd "C--") 'jedi:show-doc)


(require 'dired-x)
(evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
(evil-define-key 'normal dired-mode-map "r" 'revert-buffer) ; reload folder
;(evil-define-key 'normal undo-tree-visualizer-mode-map "n" 'undo-tree-visualizer-select-next) ; next Undo
;(evil-define-key 'normal undo-tree-visualizer-mode-map "p" 'undo-tree-visualizer-select-prev) ;
;(evil-define-key 'normal undo-tree-visualizer-mode "j" 'undo-tree-visualizer-select-next)



; Org mode shortcuts
;(evil-define-key 'normal org-mode-map (kbd "M") 'org-metaleft)
;(evil-define-key 'normal org-mode-map (kbd "J") 'org-metadown)
;(evil-define-key 'normal org-mode-map (kbd "K") 'org-metaup)
;(evil-define-key 'normal org-mode-map (kbd "L") 'org-metaright)

(evil-declare-key 'normal org-mode-map
                  "gh" 'outline-up-heading
                  "gl" 'outline-next-visible-heading
                  "-" 'org-ctrl-c-minus ; change bullet style
                  "<" 'org-metaleft ; out-dent
                  ">" 'org-metaright ; indent
                  [tab] 'org-cycle)

(setq evil-want-C-u-scroll t)

;; evil
(require 'evil)
(evil-mode 1)


(provide 'init-evil)
