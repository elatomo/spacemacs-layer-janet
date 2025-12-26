;;; layers.el --- Janet layer dependencies declaration for Spacemacs -*- lexical-binding: t; -*-

(configuration-layer/declare-layer-dependencies
 '(syntax-checking
   lsp))

;; Ensure org knows about janet-ts-mode for src blocks
(with-eval-after-load 'org
  (add-to-list 'org-src-lang-modes '("janet" . janet-ts)))

;;; layers.el ends here
