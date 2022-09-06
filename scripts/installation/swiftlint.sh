if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Update homebrew recipes
brew update
brew install swiftlint
echo "Ready to go!.."