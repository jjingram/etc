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

(defun spacemacs/slime-eval-expression-end-of-line ()
    "Put the point at the end of the line and then evaluate."
  (interactive)
  (save-excursion
    (evil-end-of-line)
    (slime-eval-last-expression)))

(defun spacemacs/slime-switch-to-repl-buffer ()
  (interactive)
  (switch-to-buffer-other-window (slime-repl-buffer)))

(defun spacemacs//slime-chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (and string-start (+ whitespace))
                                    (and (+ whitespace) string-end)))
                            ""
                            str))

;; Should remove the comment from defuns.
(defun spacemacs//send-thing-to-repl (thing)
  "Send THING at point to the slime repl.
THING should be a symbol specifying a type of syntactic entity.
Possibilities include `defun' and `line'."
  (unless (memq thing '(defun line))
    nil)
  (let ((form (spacemacs//slime-chomp (thing-at-point thing t))))
    (when form
      (with-current-buffer (slime-repl-buffer)
        (slime-insert-indented form)
        (slime-repl-return)))))

(defun spacemacs/slime-send-buffer-to-repl ()
  (interactive)
  (slime-load-file (buffer-file-name)))

(defun spacemacs/slime-send-buffer-to-repl-and-focus ()
  (interactive)
  (spacemacs/slime-send-buffer)
  (spacemacs/slime-switch-to-repl-buffer))

(defun spacemacs/slime-send-defun-to-repl ()
  (interactive)
  (spacemacs//send-thing-to-repl 'defun))

(defun spacemacs/slime-send-defun-to-repl-and-focus ()
  (interactive)
  (spacemacs/slime-send-defun)
  (spacemacs/slime-switch-to-repl-buffer))

(defun spacemacs/slime-send-line-to-repl ()
  (interactive)
  (spacemacs//send-thing-to-repl 'line))

(defun spacemacs/slime-send-line-to-repl-and-focus ()
  (interactive)
  (spacemacs/send-line)
  (spacemacs/slime-switch-to-repl-buffer))

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
      (evilify slime-inspector-mode slime-inspector-mode-map)
      (evilify sldb-mode sldb-mode-map))
    :config
    (progn
      (slime-setup)
      (evil-define-key 'motion slime-repl-mode-map
        "C-j" 'slime-repl-next-input
        "C-k" 'slime-repl-previous-input
        "C-l" 'slime-repl-clear-buffer
        "C-r" 'slime-repl-previous-matching-input)
      (evil-leader/set-key-for-mode 'lisp-mode
        "m," 'slime-selector

        "mcb" 'slime-compile-file
        "mcc" 'slime-compile-defun
        "mcr" 'slime-compile-and-load-file

        "mdi" 'slime-inspect

        "meb" 'slime-eval-buffer
        "mee" 'slime-eval-last-expression
        "meE" 'slime-edit-value
        "mef" 'slime-eval-defun
        "mel" 'spacemacs/slime-eval-expression-end-of-line
        "mep" 'slime-pprint-eval-last-expression
        "mer" 'slime-eval-region
        "meu" 'slime-undefine-function
        "me$" 'spacemacs/slime-eval-expression-end-of-line
        "me:" 'slime-interactive-eval

        ;; TODO:
        ;; "mgt" go to corresponding test file if any
        ;; "mga" go to alternate file (i.e. .h <--> .cpp)
        ;;
        ;; Do these make sense in the context of Common Lisp?
        ;;
        ;; "SPC e n" and "SPC e N" for previous and next compiler note.
        ;;
        ;; C-t return from "mg[gG]".
        "mgg" 'slime-edit-definition
        "mgG" 'slime-edit-definition-other-window

        "mha" 'slime-apropos
        "mhf" 'slime-describe-function
        "mhh" 'slime-describe-symbol
        "mhH" 'hyperspec-lookup
        "mhp" 'slime-describe-package
        "mhz" 'slime-apropos-all
        "mh#" 'hyperspec-lookup-reader-macro
        "mh~" 'hyperspec-lookup-format

        ;; Micro-state?
        "mm1" 'slime-macroexpand-1
        "mma" 'slime-macroexpand-all

        ;; How to implement send buffer and switch to REPL to debug (step)?
        ;; (i.e. "msd" and "msD")
        "msb" 'spacemacs/slime-send-buffer
        "msB" 'spacemacs/slime-send-buffer-to-repl-and-focus
        "msc" 'slime-connect
        "mse" 'slime-send-last-expression-to-repl-and-focus
        "msf" 'spacemacs/slime-send-defun
        "msF" 'spacemacs/slime-send-defun-to-repl-and-focus
        "msi" 'slime
        "msl" 'spacemacs/slime-send-line
        "msL" 'spacemacs/slime-send-line-to-repl-and-focus
        "msp" 'slime-repl-set-package
        "msq" 'slime-quit-lisp
        ;; "msr" 'spacemacs/slime-send-region
        ;; "msR" 'spacemacs/slime-send-region-to-repl-and-focus
        "mst" 'slime-toggle-trace-fdefinition
        "ms~" 'slime-sync-package-and-default-directory

        "mwb" 'slime-who-binds
        "mwc" 'slime-who-calls
        "mwm" 'slime-who-macroexpands
        "mwr" 'slime-who-references
        "mws" 'slime-who-sets
        "mww" 'slime-calls-who))))
