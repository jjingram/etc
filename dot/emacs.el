;; -*- flycheck-disabled-checkers: (emacs-lisp-checkdoc); -*-

(defmacro defparameter (symbol &optional initvalue docstring)
  `(progn
     (defvar ,symbol nil ,docstring)
     (setq ,symbol ,initvalue)))

(require 'package)

(defparameter package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")))

(defparameter my-packages
  '(evil evil-matchit evil-surround evil-lisp-state evil-leader helm
         helm-descbinds exec-path-from-shell diminish epl company flycheck
         smartparens magit hydra))

(package-initialize)

(require 'cl-lib)

(defun flatten (lst)
  (cond
   ((null lst) nil)
   ((atom lst) (list lst))
   (t (append (flatten (car lst)) (flatten (cdr lst))))))

(defun filter (condp lst)
  (delq nil (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

(defun get-dependencies (pkgs)
  (cl-remove-duplicates
   (flatten
    (cl-loop for pkg in pkgs
             for pkg-vec = (cadr (assq pkg package-alist))
             when pkg-vec
             collect (cons pkg (cl-loop for req in (package-desc-reqs pkg-vec)
                                        for req-name = (car req)
                                        when (memq req-name
                                                   package-activated-list)
                                        collect req-name))))))

(defun get-orphaned-packages (pkgs)
  (let ((pkgs-and-deps (get-dependencies pkgs)))
    (cl-remove-duplicates
     (filter '(lambda (x) (eq nil (memq x pkgs-and-deps)))
             package-activated-list))))

(defun prune-packages (pkgs)
  (let ((orphans (get-orphaned-packages pkgs)))
    (dolist (pkg orphans)
      (package-delete (cadr (assq pkg package-alist))))))

(defun packages-installed-p ()
  (not (memq 'nil (mapcar (lambda (p) (package-installed-p p)) my-packages))))

(defun packages-sync (packages)
  (prune-packages my-packages)
  (unless (packages-installed-p)
    (package-refresh-contents)
    (dolist (p my-packages)
      (when (not (package-installed-p p))
        (package-install p)))))

(packages-sync my-packages)

(setq scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 80
              sentence-end-double-space nil)

(setq column-number-mode t
      load-prefer-newer t
      require-final-newline t)


(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil
      inhibit-startup-message t
      initial-scratch-message ""
      inhibit-startup-echo-area-message "jji"
      vc-follow-symlinks t
      kill-buffer-query-functions (remq 'process-kill-buffery-query-function
                                        kill-buffer-query-functions))

;; Make <escape> quit as much as possible
(define-key minibuffer-local-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-ns-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map (kbd "<escape>") 'keyboard-escape-quit)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(require 'apropos)
(setq apropos-do-all t)

(setq eval-expression-print-length nil
      eval-expression-print-level nil)

(custom-set-variables '(ring-bell-function 'ignore))
(setq visible-bell nil)

(set-frame-font "Anonymous Pro-24")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(show-paren-mode 1)

(require 'whitespace)
(diminish 'whitespace-mode)
(setq whitespace-line-column 80)
(setq-default whitespace-style '(face indentation empty lines-tail trailing))
(add-hook 'before-save-hook 'whitespace-cleanup)

(require 'saveplace)
(setq save-place t
      save-place-file (concat user-emacs-directory "places"))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'evil)
(require 'evil-surround)
(require 'evil-leader)
(require 'evil-lisp-state)
(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)
(global-evil-leader-mode 1)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "u" 'universal-argument
  "!" 'shell)
(setq evil-lisp-state-leader-prefix "s")
(setq evil-esc-delay 0)
(evil-mode 1)

(require 'undo-tree)
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo/"))))
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

(require 'smartparens)
(require 'smartparens-config)
(sp-use-paredit-bindings)
(diminish 'smartparens-mode)

(require 'flycheck)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

(require 'helm)
(require 'helm-config)
(require 'helm-command)
(require 'helm-semantic)
(require 'helm-imenu)
(require 'helm-descbinds)
(helm-descbinds-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-:") 'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-h a") 'helm-apropos)
(define-key evil-ex-map "e " 'helm-find-files)
(define-key evil-ex-map "b " 'helm-mini)
(setq helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-apropos-fuzzy-match t)
(evil-leader/set-key
  ":" 'helm-M-x
  "/" 'helm-occur)
(defhydra hydra-helm (:hint nil)
  "
-- HELM --"
  ("?" helm-help)
  ("<escape>" keyboard-escape-quit)
  ("q" keyboard-escape-quit)
  ("<SPC>" helm-toggle-visible-mark)
  ("*" helm-toggle-all-marks)
  ("<tab>" helm-select-action)
  ("gg" helm-beginning-of-buffer)
  ("G" helm-end-of-buffer)
  ("h" helm-previous-source)
  ("j" helm-next-line)
  ("k" helm-previous-line)
  ("l" helm-next-source)
  ("C-f" helm-next-page)
  ("C-b" helm-previous-page)
  ("C-w" evil-window-map)
  ("i" nil))
(define-key helm-map (kbd "<SPC>") 'hydra-helm/body)

(require 'company)
(require 'company-dabbrev)
(require 'company-clang)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 2
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-frontends '(company-pseudo-tooltip-frontend)
      company-clang-prefix-guesser 'company-mode/more-than-prefix-guesser)
(define-key company-active-map (kbd "C-/") 'company-search-candidates)
(define-key company-active-map (kbd "C-M-/") 'company-filter-candidates)
(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-l") 'company-complete-selection)
(diminish 'company-mode)

(defun my-emacs-lisp-mode-hook ()
  (eldoc-mode 1)
  (diminish 'eldoc-mode)
  (whitespace-mode)
  (company-mode 1)
  (smartparens-strict-mode 1)
  (flycheck-mode 1))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
