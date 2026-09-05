# macOS Development Setup

A small, reproducible setup for my macOS development environment.

## Fresh Mac Setup

### 1. Update macOS

Install all available macOS updates.

### 2. Install Apple Command Line Tools

```bash
xcode-select --install
```

### 3. Install Homebrew

Install Homebrew from [brew.sh](https://brew.sh), then verify:

```bash
brew --version
brew doctor
```

### 4. Install Git and GitHub CLI

```bash
brew install git gh
rehash
```

Authenticate with GitHub:

```bash
gh auth login
```

Configure Git:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
git config --global core.editor "nvim"
gh config set editor nvim
```

### 5. Clone this repo

```bash
cd ~
gh repo clone bhusalc-bipin/config_manager
cd config_manager
```

### 6. Install packages and apps

```bash
brew bundle
brew bundle check
```

### 7. Link configs

If Homebrew created `~/.zprofile`, move it out of the way first:

```bash
mv ~/.zprofile ~/.zprofile.pre-stow 2>/dev/null || true
```

Then:

```bash
stow zsh tmux ghostty nvim hammerspoon
exec zsh -l
```

Once everything works:

```bash
rm -f ~/.zprofile.pre-stow
```

### 8. Install Rust if needed

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

exec zsh -l
```

### 9. Finish setup

- Grant Accessibility permission to Hammerspoon and Rectangle.
- Open Neovim once and let Lazy/Mason finish installing plugins and tools.
