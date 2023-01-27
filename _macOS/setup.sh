#!/usr/bin/env zsh

ROOT=$(git rev-parse --show-toplevel)
source  $ROOT/utils.sh

pHeader "Setting up MacOS"
# MacOS-only stuff. Abort if not MacOS.
if [[ $(uname -s) != "Darwin" ]]; then
    pBad "Not MacOS. Exiting."
    exit
fi

# install homebrew
pStep "Installing homebrew..."
if [[ -x "$(command -v brew)" ]]; then
    pGood "Homebrew already installed"
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    && pFinishStep "Success"
fi

# install all packages from Brewfile
pStep "Installing formulas in the Brewfile..."
if brew bundle --file=$ROOT/_install/Brewfile; then
    pGood "All formulas were installed"
else
    pBad "Something went wrong"
fi

# add zsh to /etc/shells
pStep "Adding zsh from brew to /etc/shells"
if grep -q `which zsh` /etc/shells; then
    pGood "`which zsh` already in the /etc/shells"
else
    echo `which zsh` | sudo tee -a /etc/shells && \
    pGood "Success"
fi

# change shell to brew zsh
pStep "change user shell to brew zsh"
if chsh -s `which zsh`; then
    pGood "user shell changed to `which zsh`"
else
    pBad "user shell couldn't be changes"
fi


# https://macos-defaults.com/
pStep "Applying Hacker Settings..."

pStep "Dock"
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "tilesize" -int "48"
defaults write com.apple.dock "autohide" -bool true
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "autohide-delay" -float "0.0"
defaults write com.apple.dock "show-recents" -bool false
defaults write com.apple.dock "show-process-indicators" -bool true
defaults write com.apple.dock "launchanim" -bool false
# defaults write com.apple.dock "mineffect" -string "genie"
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool true
defaults write com.apple.dock no-glass -bool true
defaults write com.apple.dock showhidden -bool true

pStep "Hot corners"
# bottom left: none
defaults write com.apple.dock "wvous-bl-corner" -int 1
defaults write com.apple.dock "wvous-bl-modifier" -int 0
# bottom right: none
defaults write com.apple.dock "wvous-br-corner" -int 1
defaults write com.apple.dock "wvous-br-modifier" -int 0
# top left: Launchpad
defaults write com.apple.dock "wvous-tl-corner" -int 11
defaults write com.apple.dock "wvous-tl-modifier" -int 0
# top right: notification
defaults write com.apple.dock "wvous-tr-corner" -int 12
defaults write com.apple.dock "wvous-tr-modifier" -int 0

pStep "Screenshots"
defaults write com.apple.screencapture "include-date" -bool true
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture "location" -string "~/Desktop/Screenshots"
defaults write com.apple.screencapture "show-thumbnail" -bool true
defaults write com.apple.screencapture "type" -string "png"

pStep "Safari"
defaults write com.apple.safari "ShowFullURLInSmartSearchField" -bool true
defaults write com.apple.Safari "DebugSnapshotsUpdatePolicy" -int "2"
defaults write com.apple.Safari "IncludeInternalDebugMenu" -bool true
defaults write com.apple.Safari "FindOnPageMatchesWordStartsOnly" -bool false
# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari "ProxiesInBookmarksBar" "()"

pStep "Finder"
defaults write com.apple.finder "DisableAllAnimations" -bool true
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool true
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true
defaults write com.apple.finder "ShowStatusBar" -bool true
# defaults write com.apple.finder "ShowPathbar" -bool true
defaults write com.apple.finder "QLEnableTextSelection" -bool true
defaults write com.apple.finder "QuitMenuItem" -bool true
# SCcf,SCsp,SCev
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool true
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool true
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

pStep "Trash"
defaults write com.apple.finder "EmptyTrashSecurely" -bool true
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool true
defaults write com.apple.finder "WarnOnEmptyTrash" -bool false


pStep "Desktop"
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool true
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool true
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool true

pStep "Menubar"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM h:mm:ss\""
defaults write com.apple.menuextra.battery "ShowPercent" -string "YES"
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

pStep "TextEdit"
defaults write com.apple.TextEdit "RichText" -bool false

pStep "TimeMachine"
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool true

pStep "ActivityMonitor"
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "5"
defaults write com.apple.ActivityMonitor "IconType" -int "5"

pStep "Terminal.app"
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal "StringEncodings" -array 4

pStep "Mail.app"
defaults write com.apple.Mail "DisableReplyAnimations" -bool true
defaults write com.apple.Mail "DisableSendAnimations" -bool true
defaults write com.apple.mail "AddressesIncludeNameOnPasteboard" -bool false

pStep "Screensaver"
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver "askForPassword" -int 1
defaults write com.apple.screensaver "askForPasswordDelay" -int 0

pStep "Keyboard"
# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain "AppleKeyboardUIMode" -int 3
defaults write NSGlobalDomain "KeyRepeat" -int 1
defaults write NSGlobalDomain "InitialKeyRepeat" -int 15
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool false


pStep "Misc"
# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain "AppleFontSmoothing" -int 2
# Disable auto-correct
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false
# Disable window animations and Get Info animations in Finder
defaults write NSGlobalDomain "NSAutomaticWindowAnimationsEnabled" -bool false
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain "NSWindowResizeTime" -float 0.001
# Disable Resume system-wide
defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindows" -bool false
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true

pStep "Security"
# # Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Disable disk image verification
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Kill affected applications
for app in Dock Safari Finder Dock Mail SystemUIServer TextEdit "Activity\ Monitor" ; do killall "$app" > /dev/null 2>&1; done
pWarning "Done. Note that some of these changes require a logout/restart to take effect."

pStep "Link Documents folder to iCloud"
rm -rf ~/Documents
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents ~/Documents

pFinishStep "Done!"
