;;; funcs.el --- Janet layer functions -*- lexical-binding: t; -*-

(defun spacemacs//janet-setup-backend ()
  "Setup Janet backend."
  (when (eq janet-backend 'lsp)
    (spacemacs//janet-setup-lsp)))

(defun spacemacs//janet-setup-lsp ()
  "Setup LSP backend for Janet."
  (if (configuration-layer/layer-used-p 'lsp)
      (lsp-deferred)
    (message "LSP layer not found. Add 'lsp' to dotspacemacs-configuration-layers.")))

;;; funcs.el ends here
