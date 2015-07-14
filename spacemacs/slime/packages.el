;;; packages.el --- slime Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq slime-packages '(slime slime-company))

(defun slime/init-slime ()
  (use-package slime
    :commands slime-mode
    :init
    (progn
      (setq slime-contribs '(slime-fancy
                             slime-indentation
                             slime-sbcl-exts
                             slime-scratch
                             slime-company)
            inferior-lisp-program "sbcl")
      (when dotspacemacs-smartparens-strict-mode
        (add-hook 'slime-repl-mode-hook #'smartparens-strict-mode))
      (evilify slime-xref-mode slime-xref-mode-map)
      (evilify slime-inspector-mode slime-inspector-mode-map)
      (evilify sldb-mode sldb-mode-map))
    :config
    (progn
      (slime-setup)
      (define-key lisp-mode-map (kbd "C-]") 'slime-edit-definition)
      (define-key lisp-mode-map (kbd "C-t") 'slime-pop-find-definition-stack)
      (define-key slime-repl-mode-map (kbd "C-j") 'slime-repl-next-input)
      (define-key slime-repl-mode-map (kbd "C-k") 'slime-repl-previous-input)
      (define-key slime-repl-mode-map (kbd "C-l") 'slime-repl-clear-buffer)
      (define-key slime-repl-mode-map (kbd "C-r") 'slime-repl-previous-matching-input)
      (evil-leader/set-key-for-mode 'lisp-mode
        "m," 'slime-selector
        "mk" 'slime-compile-and-load-file
        "mc" 'slime-compile-defun
        "mK" 'slime-compile-file
        "mn" 'slime-next-note
        "mN" 'slime-previous-note
        "mC" 'slime-remove-notes
        "md" 'slime-describe-symbol
        "ma" 'slime-apropos
        "mD" 'slime-disassemble-symbol
        "mx" 'slime-eval-defun
        "me" 'slime-eval-last-expression
        "mp" 'slime-pprint-eval-last-expression))))
