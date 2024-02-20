# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# History Stettings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# Complete - autocomplete
complete -o nospace -C /opt/homebrew/bin/terraform terraform
complete -o nospace -C /opt/homebrew/bin/aws_completer aws
source $(brew --prefix)/etc/bash_completion.d/az

# gpg tool
export GPG_TTY=$(tty)

# liquibase
export LIQUIBASE_HOME=$(brew --prefix)/opt/liquibase/libexec

# aws-vault
PS1="($AWS_VAULT) %n@ %1d$ "

# pg14
# export PATH="/opt/homebrew/Cellar/libpq/14.2/bin:$PATH"
#export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# python
# export PATH="$(brew --prefix)/opt/python@3.10/libexec/bin:$PATH"

# terraform 
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# pg_dump
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# multi-client-os
## Function to source .env file if it exists
auto_source_env() {
  if [[ $PWD == "$HOME/work"* ]] && [ -f ../.env ]; then
    source ../.env
    echo "We are in work folder. Env was prepared. Enjoy."
  fi
}

# Call auto_source_env function whenever a new shell is opened
auto_source_env

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
