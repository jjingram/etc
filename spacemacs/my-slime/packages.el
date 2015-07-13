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

(defun slime-eval-sexp-end-of-line ()
  (interactive)
  (save-excursion
    (evil-end-of-line)
    (slime-eval-last-expression)))

(defun slime/init-slime ()
  (use-package slime
    :commands slime-mode
    :init
    (progn
      (setq slime-contribs '(slime-fancy slime-indentation slime-sbcl-exts
                                         slime-scratch)
            inferior-lisp-program "sbcl")
      (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
      (add-hook 'slime-repl-mode-hook #'smartparens-strict-mode)
      (add-to-hooks 'slime-mode '(lisp-mode-hook))
      (evilify slime-inspector-mode slime-inspector-mode-map)
      (evilify sldb-mode sldb-mode-map))
    :config
    (progn
      (slime-setup '(slime-company))
      (define-key 'lisp-mode (kbd "C-SPC") 'slime-selector)
      (evil-leader/set-key-for-mode lisp-mode
        "m," 'lisp-state-toggle-lisp-state

        "me$" 'slime-eval-sexp-end-of-line
        "mel" 'slime-eval-sexp-end-of-line
        "mee" 'slime-eval-last-sexp
        "mef" 'slime-eval-defun
        "meb" 'slime-eval-buffer
        "mer" 'slime-eval-region
        "me:" 'slime-interactive-eval
        "mep" 'slime-pprint-eval-last-expression
        "meE" 'slime-edit-value
        "meu" 'slime-undefine-function
        "mei" 'slime-inspect

        "mcf" 'slime-compile-defun
        "mcC" 'slime-compile-and-load-file
        "mcc" 'slime-compile-file
        "mcr" 'slime-compile-region
        "mcl" 'slime-load-file

        "mgn" 'slime-next-note
        "mgN" 'slime-previous-note
        ;; C-t to go back to where `mgg' was invoked.
        "mgg" 'slime-edit-definition

        "mhd" 'slime-describe-symbol
        "mhf" 'slime-describe-function
        "mha" 'slime-apropos
        "mhz" 'slime-apropos-all
        "mhp" 'slime-describe-package
        "mhh" 'hyperspec-lookup
        "mh~" 'hyperspec-lookup-format
        "mh#" 'hyperspec-lookup-reader-macro

        "mwc" 'slime-who-calls
        "mww" 'slime-calls-who
        "mwr" 'slime-who-references
        "mwb" 'slime-who-binds
        "mws" 'slime-who-sets
        "mwm" 'slime-who-macroexpands

        "mm1" 'slime-macroexpand-1
        "mma" 'slime-macroexpand-all

        "msi" 'slime
        "msb" 'slime-interrupt
        "ms~" 'slime-sync-package-and-default-directory
        "msp" 'slime-repl-set-package
        "msd" 'slime-disassemble-definition
        "mst" 'slime-toggle-trace-fdefinition
        "mse" 'slime-eval-last-expression-in-repl
        "msq" 'slime-quit-lisp))))
