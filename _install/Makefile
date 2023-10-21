.PHONY: Brewfile


Brewfile:
	@echo "Updating Brewfile..."
	brew bundle dump --force --taps --brews --casks --mas

install:
	@echo "Installing Brewfile..."
	brew install

reinstall:
	@echo "Reinstalling Brewfile..."
	brew bundle --force --verbose
