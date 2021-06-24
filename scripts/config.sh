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

# Update Zsh settings
printf "⚙️ Update Zsh settings...\n"
sudo rm -rf ~/.zprofile > /dev/null 2>&1
cp $CONFIG/zprofile.template ~/.zprofile

# Configure macOS Finder
printf "⚙️ Configure Finder...\n"
# Show file extension in Finder
defaults write -g AppleShowAllExtensions -bool true
# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles true
# Show full path
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Set list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Set current folder as default search
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Show path bar in Finder window
defaults write com.apple.finder ShowPathbar -bool true
# Keep folders on top in Finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Show Library folder
chflags nohidden ~/Library
# Disable creation of metadata files on Network and USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Show HD icons on Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
# Turn off window opening animation
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Turn off file info animation
defaults write com.apple.finder DisableAllAnimations -bool true
# Remove open-with duplicates
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
killall Finder

printf "⚙️ Configure Dock...\n"
# Set Dock icon size
defaults write com.apple.dock tilesize -int 40
# Remove Dock animation
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# Configure macOS Screen Capture
printf "⚙️ Save screenshots in PNG format...\n"
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots"
defaults write com.apple.screencapture type -string "png"

# Configure macOS Keyboard
printf "⚙️ Configure Keyboard...\n"
# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# Disable automatic period substitution
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart dashes
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
# Disable smart quotes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
# Enable tabbing between all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable cotninuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Configure macOS Trackpad
printf "⚙️ Configure Trackpad...\n"
# Enable tap to click. (Don't have to press down on the trackpad -- just tap it.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Enable tap to click for the login screen.
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Enable natural scrolling
defaults -currentHost write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# Enable 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Configure macOS Safari
printf "⚙️ Configure Safari...\n"
# Disable Apple send queries
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
# Don't open safe files
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Show favorites bar
defaults write com.apple.Safari ShowFavoritesBar -bool true
# Enable develop menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Configure macOS TextEdit
printf "⚙️ Configure TextEdit...\n"
# Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 encoding
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Configure macOS
printf "⚙️ Various configuration...\n"
# Game Center: disable Game Center
defaults write com.apple.gamed Disabled -bool true
# Security: Enable firewall
# sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
# TimeMachine: prevent from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Localisation - Set default temperature unit as Celsius
defaults write -g AppleTemperatureUnit -string "Celsius"
# Localisation - set measurement units
defaults write -g AppleMeasurementUnits -string "Centimeters"
# Localisation - set metric units
defaults write -g AppleMetricUnits -bool true



# Create Work directory
printf "⚙️ Create Work directory...\n"
mkdir ${HOME}/Work
chmod 777 ${HOME}/Work

# Exit script
exit
