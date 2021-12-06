#!/bin/sh
set -e

# Pulled from https://gist.github.com/chrisidakwo/5f228cb0883efdcfae1a880f80b9744b, THANK YOU chrisidakwo!

# Run this script like - bash script-name.sh

echo "Hello bb."
echo "What is your name? (doesnt have to be your real name), then hit [ENTER]."
read name

echo "Enter your email you plan to use for github, then hit [ENTER]."
read email

echo "==> Removing any previous NVM directory if already installed."

# Removed if already installed
rm -rf ~/.nvm

# Unset exported variable
export NVM_DIR=

echo "==> Installing node version manager (NVM)."

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Make nvm command available to terminal
source ~/.nvm/nvm.sh

echo "==> Ensuring .bash_profile exists and is writable"
touch ~/.bash_profile

echo "==> Adding NVM to ~/.bash_profile"
echo "" >> ~/.bash_profile
echo "export NVM_DIR=\"\$HOME/.nvm\"" >> ~/.bash_profile
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\" # This loads nvm" >> ~/.bash_profile
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\" # This loads nvm bash_completion" >> ~/.bash_profile

echo "==> Installing node js long-term-support (LTS)"
nvm install --lts

echo "==> If node installation fails fails, go to https://nodejs.org/en/download/ and select the right installer."
echo "==> After installing node, close and reopen Git Bash once again!"

echo "==> Checking for versions"
nvm --version
node --version
npm --version

echo "==> Print binary paths"
which nvm
which npm
which node

echo "==> List installed node versions"
nvm ls
nvm cache clear

echo "==> Creating SSH Key"
ssh-keygen -t rsa -N "" -f id_rsa -C "$email"

echo "==> Starting SSH agent"
eval "$(ssh-agent -s)"

echo "==> Adding SSH key to agent"
ssh-add ~/.ssh/id_rsa

echo "==> Key copied to clipboard."
clip < ~/.ssh/id_ed25519.pub

echo "==> Go to https://github.com/settings/ssh/new"
echo "==> Enter anything for the Title of the key"
echo "==> Go to the key textbox, and press ctrl+v to paste, then click Add SSH Key"
echo "==> You should see the new key you made at https://github.com/settings/keys"
echo "==> The script will now pause to give you time to add your key to Github"
read -p "Press [Enter] key after your key is added to Github..."

echo "==> Making CypherCam directory"
mkdir ~/CypherCam
cd ~/CypherCam

echo "==> Updating Git config"
git config --global user.name "$name"
git config --global user.email "$email"

echo "==> Cloning the CypherCam repository"
git clone git@github.com:rickstergg/CypherCam.git .

echo "==> Running NPM install"
npm install

echo "==> You should be good, run 'node bot.js' to start CypherCam"



