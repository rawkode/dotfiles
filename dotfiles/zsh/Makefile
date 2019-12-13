default:
	@mkdir -p $(HOME)/.zsh/includes -p $(HOME)/.zplugin
	@if [ ! -d "$(HOME)/.zplugin/bin" ]; then git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin; fi
	@cp zshrc.zsh $(HOME)/.zshrc
	@cp zplugin.zsh $(HOME)/.zsh/zplugin.zsh
	@cp -R ./includes/* $(HOME)/.zsh/includes/
