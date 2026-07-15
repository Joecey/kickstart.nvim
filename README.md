# neovim config

Personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Custom packages

In addition to the kickstart.nvim defaults, this config adds:

| Plugin | Description |
| --- | --- |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Colorscheme |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump/motion search |
| [hotreload.nvim](https://github.com/diogo464/hotreload.nvim) | Auto-reload buffer on file changes |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Animated cursor |
| [twilight.nvim](https://github.com/folke/twilight.nvim) | Dim inactive code for focus |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |

## Requirements

- [Neovim](https://github.com/neovim/neovim/releases/tag/stable) (latest stable)
- `git`, `make`, `unzip`, C compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [fd-find](https://github.com/sharkdp/fd#installation)
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md#installation)
- Clipboard tool (xclip/xsel on Linux, win32yank on Windows, built-in on Mac)
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)
- Language tooling as needed (e.g. `npm` for TypeScript, `go` for Golang)

## Installation

Back up any existing Neovim config first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### Linux and Mac

```sh
git clone https://github.com/Joecey/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

#### Mac (Homebrew)

```sh
brew install neovim git make ripgrep fd tree-sitter unzip
```

#### Ubuntu / Debian

```sh
sudo apt update
sudo apt install make gcc ripgrep fd-find tree-sitter-cli unzip git xclip curl
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```

#### Fedora

```sh
sudo dnf install -y gcc make git ripgrep fd-find tree-sitter-cli unzip neovim
```

#### Arch

```sh
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd tree-sitter-cli unzip neovim
```

### Windows

#### cmd

```cmd
git clone https://github.com/Joecey/kickstart.nvim.git "%localappdata%\nvim"
```

#### PowerShell

```powershell
git clone https://github.com/Joecey/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

Install dependencies via [Chocolatey](https://chocolatey.org/install) (run as admin):

```cmd
choco install -y neovim git ripgrep wget fd unzip gzip mingw make tree-sitter
```

### Post-install

Start Neovim:

```sh
nvim
```

`vim.pack` will install all plugins automatically. Run `:checkhealth` if anything fails.

## Acknowledgements

Built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by TJ DeVries.
