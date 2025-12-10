# dotfiles

chezmoi-managed dotfiles.

## Bootstrap

1. Install prerequisites:
   ```bash
   # Debian/Ubuntu
   sudo apt install age git

   # Fedora
   sudo dnf install age git
   ```

2. Restore `~/.config/chezmoi/key.txt` from password manager

3. Install chezmoi and apply:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply fwmechanic/dotfiles
   ```

4. When prompted "Is this a work machine?" answer accordingly.

## Day-to-day usage

```bash
chezmoi edit ~/.bash_aliases   # edit a managed file
chezmoi diff                   # see pending changes
chezmoi apply                  # apply changes to home directory
chezmoi cd                     # cd into source directory
chezmoi git status             # run git commands in source repo
```
