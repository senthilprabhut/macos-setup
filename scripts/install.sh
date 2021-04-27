#!/bin/bash

###############################################################################
# Set variables                                                               #
###############################################################################

SETUP=~/macos-setup                  # root folder of macos-setup
BIN=$SETUP/scripts            # shell scripts
CONFIG=$SETUP/config          # configuration files directory

###############################################################################
# Install                                                                     #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Brew
printf "⚙️ Check Brew...\n"
if test ! $(which brew); then
  # Install Homebrew
    printf "📦 Installing XCode CL tools...\n"
    #xcode-select --install
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    softwareupdate -i -a
    rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    printf "📦 Installing Homebrew...\n"
    /bin/bash -c "$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Change permissions
    brew -v
  # Install Cask
    sudo chown -R $USER /usr/local/Cellar
  # Install Bundle
    printf "📦 Installing Brew Bundle...\n"
    brew tap Homebrew/bundle
  # Install MAS
    printf "📦 Installing MAS...\n"
    brew install mas
  # Check Brews
    brew -v update && brew -v upgrade && mas upgrade && brew -v cleanup --prune=2 && brew doctor
  # Install Homebrew apps
    printf "📦 Installing Apps...\n"
    brew bundle --file=$SETUP/Brewfile
  # Cleanup
    printf "⚙️ Cleanup and final touches...\n"
    brew -v update && brew -v upgrade && mas upgrade && brew -v cleanup --prune=2 && brew doctor && brew -v upgrade --casks --greedy
else
    printf "📦 Homebrew is already installed...\n"
    exit

fi

# Exit script
exit
