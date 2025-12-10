# dotfiles

chezmoi-managed dotfiles.

## Bootstrap

1. Install prerequisites:
   ```bash
   # Debian/Ubuntu
   sudo apt install age git curl bash-completion
   ```

   ```bash
   # Fedora
   sudo dnf install age git curl bash-completion
   ```

2. Restore `~/.config/chezmoi/key.txt` from password manager

   If restoring from a passphrase-encrypted backup:
   ```bash
   mkdir -p ~/.config/chezmoi
   age -d -o ~/.config/chezmoi/key.txt /path/to/key.txt.age
   chmod 600 ~/.config/chezmoi/key.txt
   ```

3. Install chezmoi and apply:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply fwmechanic/dotfiles
   ```

4. When prompted "Is this a work machine?" answer accordingly.

5. Start a new login shell (or run `~/.local/bin/chezmoi` if chezmoi isn't in PATH yet):
   ```bash
   bash -l
   ```

## Day-to-day usage

```bash
chezmoi edit ~/.bash_aliases   # edit a managed file
chezmoi diff                   # see pending changes
chezmoi apply                  # apply changes to home directory
chezmoi cd                     # cd into source directory
chezmoi git status             # run git commands in source repo
```
