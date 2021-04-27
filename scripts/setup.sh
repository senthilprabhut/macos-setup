#!/bin/bash

# USAGE
# ./setup.sh [OPTION]


# OPTIONS
process_option() {
  case $1 in
    'all')
      source scripts/install.sh
      source scripts/config.sh
      source scripts/dev.sh
      break;;
    'install')
      source scripts/install.sh
      break;;
    'configure')
      source scripts/config.sh
      break;;
    'update')
      source scripts/update.sh
      break;;
    'dev')
      source scripts/dev.sh
      break;;
    'brew')
      brew bundle
      break;;
    'q')
      break;;
    *)
      break;;
  esac
}


# MENU
while true; do
  if [[ $# == 0 ]]; then
    echo ""
    echo "******************"
    echo "    Setup Mac OS  "
    echo "******************"
    echo ""
    echo "Available commands:"
    echo ""
    echo "         all:  Setup everything"
    echo ""
    echo "     install:  Install System Software (e.g. Homebrew, Cask etc.)"
    echo "   configure:  Configure macOS (e.g. enabling hidden files in finder)"
    echo "      update:  Update Brewfile Dependencies & Applications"
    echo "         dev:  Configure Developer Tools (e.g. git, ssh, gerrit script)"
    echo "        brew:  Update Brewfile"
    echo ""
    echo "        q:  Quit/Exit."
    echo ""
    read -p "Enter option: " response
    echo ""
    process_option $response
  else
    process_option $1
  fi
done
