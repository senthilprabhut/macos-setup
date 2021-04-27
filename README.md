# macos-setup
This repository contains scripts that can be used to setup a brand new MacBook within minutes. It applies OSX settings, installs applications and can even configure your SSH keys.

## Installation
After your first access to macOS follow the instructions below:

1. Update macOS via Mac App Store and signin with your AppleID

2. Open *Terminal.app* and download the project with the following command `git clone https://github.com/senthilprabhut/macos-setup.git ~/macos-setup`

3. Edit the Brewfile file choosing the apps that you want to install

4. Open Terminal.app and run the following command `chmod -R 755 ~/macos-setup && ~/macos-setup/setup.sh`

5. If you haven't previously installed *X-code* then click Yes in the prompt

## Options
You can also type `~/macos-setup/setup.sh [OPTION]` to trigger a specific setup script.
1. all: perform complete installation of the apps and configuration of the mac
2. install: install Homebrew package, binaries, casks, dependencies, and Mac Apple Store application listed in Brewfile file
3. configure: configure macOS with useful commands, update zsh, and Visual Studio Code plugins and preferences
4. dev: configure git, ssh, gerrit and other dev tools

## Brewfile
Brewfile is used to specify which packages and applications you want to install with Homebrew and Homebrew Cask. You can update packages in this file by running `brew bundle` from the terminal.

## Credits
* @MarioCatuogno for [Clean-macOS](https://github.com/MarioCatuogno/Clean-macOS)
* @booch for [mac_config](https://github.com/boochtek/mac_config)
* @holman for [dotfiles](https://github.com/holman/dotfiles)
* [Customising global defaults](https://eclecticlight.co/2017/11/09/customising-it-all-global-defaults-in-macos-sierra-and-high-sierra/)
* [Better History](https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys)
