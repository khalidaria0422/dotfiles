## Zsh Configuration (XDG layout)

All Zsh config files are stored in:

```text
~/.config/zsh -> ~/.dotfiles/zsh
```

The file `~/.zshenv` (in `$HOME`) sets:

```sh
export ZDOTDIR="$HOME/.config/zsh"

```

This ensures Zsh loads all config files from the XDG directory (`~/.dotfiles/zsh`).

**Do not** place any other files (e.g., `.zshrc`, `.p10k.zsh`) directly in `$HOME`.
