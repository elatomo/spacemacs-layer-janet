# Spacemacs Janet Layer

A Spacemacs layer providing support for the [Janet](https://janet-lang.org/)
programming language.

## Features

- Syntax highlighting, indentation, and navigation via
  [janet-ts-mode](https://github.com/sogaiu/janet-ts-mode) (tree-sitter based)
- Interactive REPL integration with [ajrepl](https://github.com/sogaiu/ajrepl)
- Language Server Protocol support via
  [janet-lsp](https://github.com/CFiggers/janet-lsp)
- On-the-fly linting using
  [flycheck-janet](https://github.com/sogaiu/flycheck-janet)

### LSP Feature Status

janet-lsp is under active development. Current capabilities:

| Feature                | Status                     |
|------------------------|----------------------------|
| Auto-completion        | ✅ Works                   |
| Buffer formatting      | ✅ Works                   |
| Jump to definition     | ✅ Works (project symbols) |
| Inline compiler errors | ✅ Works                   |
| Signature help         | ✅ Works                   |
| On-hover documentation | ✅ Works                   |
| Find references        | ❌ Not yet implemented     |
| Organize imports       | ❌ Not supported           |

See [janet-lsp](https://github.com/CFiggers/janet-lsp) for latest status.

## Dependencies

- Emacs 29.1 or newer (for built-in tree-sitter support)
- [Janet](https://janet-lang.org/) installed and available on your PATH
- [janet-lsp](https://github.com/CFiggers/janet-lsp) installed (`jpm install`)

## Installation

Clone this repository into your Spacemacs private layers directory:

```bash
git clone https://github.com/elatomo/spacemacs-layer-janet.git ~/.emacs.d/private/janet
```

Add `janet` to your `dotspacemacs-configuration-layers` in your `.spacemacs`:

```elisp
dotspacemacs-configuration-layers
'(
  ;; other layers...
  janet
)
```

Sync your configuration with `SPC f e R` or restart Emacs.
