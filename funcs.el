;;; funcs.el --- Janet layer functions -*- lexical-binding: t; -*-

(defun spacemacs//janet-setup-backend ()
  "Setup Janet backend."
  (when (eq janet-backend 'lsp)
    (spacemacs//janet-setup-lsp)))

(defun spacemacs//janet-setup-lsp ()
  "Setup LSP backend for Janet."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        ;; FIXME: janet-lsp's resolveProvider blocks UI; disable detail fetching
        (setq-local lsp-completion-show-detail nil)
        (setq-local lsp-completion-show-kind nil)
        (lsp-deferred))
    (message "Janet: LSP layer not found")))

;;; funcs.el ends here
