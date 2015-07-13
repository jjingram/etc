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

(defun slime-eval-expression-eol
    "Put the point at the end of the line and then evaluate."
  (interactive)
  (save-excursion
    (evil-end-of-line)
    (slime-eval-last-expression)))

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
      (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
      (add-hook 'slime-repl-mode-hook #'smartparens-strict-mode)
      (evilify slime-inspector-mode slime-inspector-mode-map)
      (evilify sldb-mode sldb-mode-map))
    :config
    (progn
      (slime-setup)
      (evil-leader/set-key-for-mode 'lisp-mode
        "m," 'lisp-state-toggle-lisp-state

        "mcc" 'slime-compile-file
        "mcC" 'slime-compile-and-load-file
        "mcf" 'slime-compile-defun
        "mcr" 'slime-compile-region

        "me$" 'slime-eval-sexp-end-of-line
        "me:" 'slime-interactive-eval
        "meb" 'slime-eval-buffer
        "mee" 'slime-eval-last-expression
        "meE" 'slime-edit-value
        "mef" 'slime-eval-defun
        "mei" 'slime-inspect
        "mel" 'slime-eval-sexp-end-of-line
        "mep" 'slime-pprint-eval-last-expression
        "mer" 'slime-eval-region
        "meu" 'slime-undefine-function

        "mgb" 'slime-pop-find-definition-stack
        "mgg" 'slime-edit-definition
        "mgG" 'slime-edit-definition-other-window
        "mgn" 'slime-next-note
        "mgN" 'slime-previous-note

        "mh#" 'hyperspec-lookup-reader-macro
        "mh~" 'hyperspec-lookup-format
        "mha" 'slime-apropos
        "mhd" 'slime-describe-symbol
        "mhf" 'slime-describe-function
        "mhh" 'hyperspec-lookup
        "mhp" 'slime-describe-package
        "mhz" 'slime-apropos-all

        "mm1" 'slime-macroexpand-1
        "mma" 'slime-macroexpand-all

        "ms~" 'slime-sync-package-and-default-directory
        "msb" 'slime-load-file
        "msc" 'slime-connect
        ;; "msd" 'slime-disassemble-definition
        "mse" 'slime-eval-last-expression-in-repl
        "msi" 'slime
        "msp" 'slime-repl-set-package
        "msq" 'slime-quit-lisp
        "mss" 'slime-selector
        "mst" 'slime-toggle-trace-fdefinition

        "mwb" 'slime-who-binds
        "mwc" 'slime-who-calls
        "mwm" 'slime-who-macroexpands
        "mwr" 'slime-who-references
        "mws" 'slime-who-sets
        "mww" 'slime-calls-who))))
