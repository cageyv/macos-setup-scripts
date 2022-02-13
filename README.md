# macos-setup-scripts
Set of scripts and tools required for work
## First steps
- Install HomeBrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install git `brew install git`
- Git config from 1password
- Install gh `brew install gh`
- Login with GitHub `gh auth login`
- pull repo
- GPG Sign
  - Extract ```gpg --list-secret-keys user@example.com gpg --export-secret-keys YOUR_ID_HERE > private.key```
  - Import ``` gpg --import private.key ```
  - Set git ```git config --global gpg.program $(which gpg)```
- Import SSH keys

## TODO
- 1password
- brave
- slack
- telegram
- docker
- vscode
- parallels
- keybase
- dropbox
- google drive
- logi options: https://support.logi.com/hc/en-us/articles/360025297893
