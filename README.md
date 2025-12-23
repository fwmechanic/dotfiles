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
   age -d -o ~/.config/chezmoi/key.txt ~/downloads/key.txt.age
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

6. fixup remote to use ssh:
   ```bash
   chezmoi cd  # OPENS A NEW SHELL
   chezmoi git -- remote set-url origin git@github-fwmechanic:fwmechanic/dotfiles.git
   ```

## Day-to-day usage

https://www.chezmoi.io/user-guide/daily-operations/

https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/
