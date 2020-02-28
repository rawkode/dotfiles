default:
	@cp Xresources $(HOME)/.Xresources
	@mkdir -p $(HOME)/.config/i3
	@cp config $(HOME)/.config/i3/config
	@mkdir -p $(HOME)/.config/polybar
	@cp polybar.ini $(HOME)/.config/polybar/config
	@mkdir -p $(HOME)/.config/nitrogen
	@cp nitrogen.ini $(HOME)/.config/nitrogen/nitrogen.cfg

	# Root Stuff
	@sudo cp libinput.conf /etc/X11/xorg.conf.d/50-libinput.conf
