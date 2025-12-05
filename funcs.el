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
        ;; FIXME: janet-lsp doesn't clear stale diagnostics on fix.
        ;; Test again after upstream fix, then remove flycheck-janet.
        (setq-local lsp-diagnostics-provider :none)
        (lsp-deferred))
    (message "Janet: LSP layer not found")))

(defun spacemacs//janet-configure-ajrepl ()
  "Configure ajrepl for better Spacemacs integration."
  ;; Disable problematic colors
  (when janet-repl-disable-colors
    (setq ajrepl-start-cmd-line '("janet" "-s" "-n"))))

;;; funcs.el ends here
