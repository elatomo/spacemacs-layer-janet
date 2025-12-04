;;; packages.el --- Janet layer packages for Spacemacs -*- lexical-binding: t; -*-

;; Author: José Fernández Ramos <jose@navika.io>
;; URL: https://github.com/elatomo/spacemacs-layer-janet

;;; Commentary:

;; This layer adds support for the Janet programming language. It includes
;; syntax highlighting and indentation via janet-ts-mode, REPL interaction
;; through ajrepl, and flycheck linting support using flycheck-janet.

;;; Code:

;; Verify Emacs version and treesit support
(unless (and (fboundp 'treesit-available-p)
             (treesit-available-p))
  (error "Janet layer requires Emacs 29+ with built-in tree-sitter support"))

;; Install tree-sitter grammar for Janet
(unless (treesit-language-available-p 'janet-simple)
  (add-to-list 'treesit-language-source-alist
               '(janet-simple . ("https://github.com/sogaiu/tree-sitter-janet-simple")))
  (treesit-install-language-grammar 'janet-simple))

(defconst janet-packages
  '((janet-ts-mode :location (recipe
                              :fetcher github
                              :repo "sogaiu/janet-ts-mode"
                              :files ("*.el")))
    (ajrepl :location (recipe
                       :fetcher github
                       :repo "sogaiu/ajrepl"
                       :files ("*.el" "ajrepl")))
    (flycheck-janet :location (recipe
                               :fetcher github
                               :repo "sogaiu/flycheck-janet"
                               :files ("*.el"))
                    :requires flycheck)))

(defun janet/init-janet-ts-mode ()
  "Initialize janet-ts-mode with keybindings and flycheck support."
  (use-package janet-ts-mode
    :defer t
    :mode "\\.janet\\'"
    :init
    (spacemacs/declare-prefix-for-mode 'janet-ts-mode "ms" "repl")
    (spacemacs/set-leader-keys-for-major-mode 'janet-ts-mode
      "'"  'ajrepl
      "si" 'ajrepl
      "sz" 'ajrepl-switch-to-repl
      "sb" 'ajrepl-send-buffer
      "se" 'ajrepl-send-expression-at-point
      "sr" 'ajrepl-send-region)
    :config
    (spacemacs/enable-flycheck 'janet-ts-mode)))

(defun janet/init-ajrepl ()
  "Initialize ajrepl and enable interaction mode for Janet buffers."
  (use-package ajrepl
    :defer t
    :commands (ajrepl ajrepl-send-buffer ajrepl-send-region)
    :init
    (spacemacs/register-repl 'ajrepl 'ajrepl "janet")
    :config
    (add-hook 'janet-ts-mode-hook #'ajrepl-interaction-mode)))

(defun janet/post-init-flycheck ()
  "Enable flycheck for janet-ts-mode."
  (spacemacs/enable-flycheck 'janet-ts-mode))

(defun janet/init-flycheck-janet ()
  "Initialize flycheck-janet checker for Janet syntax validation."
  (use-package flycheck-janet
    :after (flycheck janet-ts-mode)
    :config
    (flycheck-add-mode 'janet-janet 'janet-ts-mode)))

;;; packages.el ends here
