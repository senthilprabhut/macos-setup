#!/bin/bash

###############################################################################
# Set variables                                                               #
###############################################################################

SETUP=~/macos-setup                  # root folder of macos-setup
BIN=~/macos-setup/scripts            # shell scripts
CONFIG=~/macos-setup/config          # configuration files directory

###############################################################################
# Configure                                                                   #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update Git settings
printf "⚙️ Update Git settings...\n"
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore > /dev/null 2>&1
cp $CONFIG/gitignore.symlink ~/.gitignore
cp $CONFIG/gitconfig.symlink ~/.gitconfig
cp $CONFIG/commit_template ~/commit_template

# Update vim settings
printf "⚙️ Update vim settings...\n"
cp $CONFIG/vimrc.template ~/.vimrc

# Install Visual Studio Code plugins [1/2]
printf "⚙️ Put Visual Studio Code in quarantine to install plugins...\n"
xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app
printf "📦 Install Visual Studio Code plugins...\n"
open -a "Visual Studio Code"
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension file-icons.file-icons
code --install-extension HookyQR.beautify
code --install-extension ivangabriele.vscode-git-add-and-commit
code --install-extension knisterpeter.vscode-github
code --install-extension yzhang.markdown-all-in-one

# Update Visual Studio Code settings [2/2]
printf "⚙️ Update Visual Studio Code settings...\n"
sudo rm -rf ~/Library/Application\ Support/Code/User/settings.json > /dev/null 2>&1
cp $CONFIG/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

# Setup SSH keys
printf "⚙️ Creating ssh keys...\n"
ssh-keygen -t rsa -b 4096 -N ''

# Setup gerrit script
printf "⚙️ Setting up gerrit script...\n"
cp $BIN/gerrit /usr/local/bin/gerrit
chmod +x /usr/local/bin/gerrit

# Setup k8sh
printf "⚙️ Setting up k8sh script...\n"
curl --fail --silent --show-error --location https://raw.githubusercontent.com/Comcast/k8sh/master/k8sh > /usr/local/bin/k8sh
chmod +x /usr/local/bin/k8sh

# Exit script
exit
