# Spacemacs Janet Layer

A Spacemacs layer providing support for the [Janet](https://janet-lang.org/)
programming language.

## Features

- Syntax highlighting, indentation, and navigation via
  [janet-ts-mode](https://github.com/sogaiu/janet-ts-mode) (tree-sitter based)
- Interactive REPL integration with [ajrepl](https://github.com/sogaiu/ajrepl)
- On-the-fly linting using
  [flycheck-janet](https://github.com/sogaiu/flycheck-janet)

## Dependencies

- Emacs 29.1 or newer (for built-in tree-sitter support)
- Janet installed and available on your PATH

## Installation

Clone this repository into your local layers directory or into your `.emacs.d/private` directory:

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
