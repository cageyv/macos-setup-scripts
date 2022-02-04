# macos-setup-scripts
Set of scripts and tools required for work
## First steps
- Install HomeBrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install git `brew install git`
- Prepare git: Copy Git config from 1password
- Install gh `brew install gh`
- Login with GitHub `gh auth login`
- Prepare GPG: 



## Configs
- GPG Sign
  - Extract ```gpg --list-secret-keys user@example.com gpg --export-secret-keys YOUR_ID_HERE > private.key```
  - Import ``` gpg --import private.key ```
- SSH keys
- Git config
- ZSH config
