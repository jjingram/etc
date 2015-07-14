;; Turn off the mouse interface early in startup to avoid momentary display.
(unless (eq system-type 'darwin)
  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1)))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; Package management
(defvar my-packages
  '(evil evil-surround evil-indent-textobject evil-commentary evil-matchit
         evil-snipe god-mode evil-god-state exec-path-from-shell undo-tree
         ido-ubiquitous flx-ido smex diminish color-theme-solarized magit
         diff-hl))

(require 'package)
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun packages-installed-p ()
  (not (memq 'nil (mapcar (lambda (p) (package-installed-p p)) my-packages))))

(unless (packages-installed-p)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;; Keybindings
(evil-mode t)

;; Files
(define-key evil-ex-map "e " 'ido-find-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)

;; Commands
(evil-define-key 'motion global-map ";" 'smex)
(evil-define-key 'normal global-map ";" 'smex)
(evil-define-key 'motion global-map "," 'evil-execute-in-god-state)
(evil-define-key 'normal global-map "," 'evil-execute-in-god-state)
(add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
(add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))

;;; Editing
(global-evil-surround-mode t)

(evil-commentary-mode t)
(diminish 'evil-commentary-mode)

;;; Navigation
(setq evil-snipe-enable-highlight nil
      evil-snipe-enable-incremental-highlight nil
      evil-snipe-show-prompt nil)
(evil-snipe-override-mode t)

;;; Help
(setq apropos-do-all t)

;;; User interface
(setq inhibit-startup-screen t
      initial-scratch-message "")

(setq column-number-mode t)

(show-paren-mode t)

;; Smooth scrolling.
(setq scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; No bells.
(custom-set-variables '(ring-bell-function 'ignore))
(setq visible-bell nil)

;; Reduce prompting.
(fset 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks t
      kill-buffer-query-functions (remq 'process-kill-buffer-query-function
                                        kill-buffer-query-functions)
      confirm-nonexistent-file-or-buffer nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(set-frame-font "Anonymous Pro-24")

(load-theme 'solarized t)

(global-diff-hl-mode)
(setq diff-hl-side 'right)
(unless (display-graphic-p)
  (setq diff-hl-side 'left)
  (diff-hl-margin-mode))

;;; Interactive do.
(ido-mode t)

(ido-everywhere t)

(ido-ubiquitous t)

(flx-ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-faces nil)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;; Formatting
(setq-default fill-column 80)

(setq-default sentence-end-double-space nil)

(setq-default indent-tabs-mode nil
              tab-width 4)

;;; Recovery
(setq backup-directory-alist `(("." . ,temporary-file-directory)))

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      auto-save-list-file-prefix temporary-file-directory)

;; Persistent undo.
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,temporary-file-directory)))
(diminish 'undo-tree-mode)

;;; Emacs Lisp
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;; \\(.+\\)$" 1) t))

(defun jji/emacs-lisp-mode-hook ()
  (eldoc-mode)
  (diminish 'eldoc-mode)
  (imenu-elisp-sections))
(add-hook 'emacs-lisp-mode-hook #'jji/emacs-lisp-mode-hook)
