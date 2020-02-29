default:
	@mkdir -p $(HOME)/.zsh/includes -p $(HOME)/.zinit
	@if [ ! -d "$(HOME)/.zinit/bin" ]; then git clone https://github.com/zdharma/zinit.git ~/.zinit/bin; fi
	@cp zshrc.zsh $(HOME)/.zshrc
	@cp zinit.zsh $(HOME)/.zsh/zinit.zsh
	@cp -R ./includes/* $(HOME)/.zsh/includes/
