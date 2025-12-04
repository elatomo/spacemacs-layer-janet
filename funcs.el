;;; funcs.el --- Janet layer functions -*- lexical-binding: t; -*-

(defun spacemacs//janet-setup-backend ()
  "Setup Janet backend."
  (when (eq janet-backend 'lsp)
    (spacemacs//janet-setup-lsp)))

(defun spacemacs//janet-setup-lsp ()
  "Setup LSP backend for Janet."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        ;; FIXME: janet-lsp's resolveProvider is slow and blocks UI when
        ;; navigating completion candidates. Disable detail fetching to keep it
        ;; responsive.
        (setq-local lsp-completion-show-detail nil)
        (setq-local lsp-completion-show-kind nil)
        (lsp-deferred))
    (message "LSP layer not found. Add 'lsp' to dotspacemacs-configuration-layers.")))

;;; funcs.el ends here
