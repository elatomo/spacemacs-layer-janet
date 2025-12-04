;;; config.el --- Janet Layer Configuration File for Spacemacs -*- lexical-binding: t; -*-

(defvar janet-backend 'lsp
  "Backend for Janet IDE features. Only 'lsp supported currently.")

(spacemacs|define-jump-handlers janet-ts-mode)

;;; config.el ends here
