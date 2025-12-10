#!/bin/bash

# Set SSH permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub 2>/dev/null || true

# Configure git to include global config (idempotent)
git config --global include.path "$HOME/gitconfig_global"

# Ensure .bashrc sources .bash_aliases
if ! grep -q '\.bash_aliases' ~/.bashrc 2>/dev/null; then
    echo 'test -f ~/.bash_aliases && . ~/.bash_aliases' >> ~/.bashrc
    echo "chezmoi: added .bash_aliases sourcing to .bashrc"
fi

echo "chezmoi: run_once_setup.sh completed"
