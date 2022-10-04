- create folder in /cageyv/work/ 
- create requred folders and files ```mkdir .aws && mkdir .ssh && touch .gitconfig && touch .env```
- update core .gitconfig in ```~/.gitconfig``` and add new customer 
```
[includeIf "gitdir:~/work/kidney/"]
  path = ~/work/kidney/.gitconfig
```
- create new SSH + PGP via ssh_pgp.sh script (copy and run it in client folder)
- add id_rsa.pub to GitHub, 
- add PGP key to GitHub ```gpg --armor --export ${KEY_ID}``` ```gpg --list-secret-keys --keyid-format=long```
- add SSH key passphrase to masOS keychain ```ssh-add --apple-use-keychain .ssh/id_rsa``` 
- update ssh config ``` .ssh/config``` (not tested, skipped)
```
Host github.com
    Hostname github.com
    User git
    PreferredAuthentications publickey
    IdentityFile .ssh/id_rsa
    UseKeychain yes
```
- update .gitconfig and add GPG key
