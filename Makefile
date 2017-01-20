DOTFILES=$(PWD)

install: apt bash bin config gnome fonts yaourt

bin:
	chmod +x $(DOTFILES)/bin/*

bash: yaourt
	ln -sfP $(DOTFILES)/bash/.bashrc ~/.bashrc
	ln -sfP $(DOTFILES)/bash/.zshrc ~/.zshrc
	mkdir -p ~/.nvm/
	ln -sfP /usr/share/nvm/init-nvm.sh ~/.nvm/nvm.sh

config: yaourt
	mkdir -p ~/.config/terminator
	mkdir -p ~/.config/uniemoji/
	ln -sfP $(DOTFILES)/config/terminator.conf ~/.config/terminator/config
	sudo ln -sfP $(DOTFILES)/config/libinput-gestures.conf /etc/libinput-gestures.conf
	git config --global core.excludesfile ~/.dotfiles/config/gitignore_global
	git clone https://github.com/amix/vimrc.git ~/.vim_runtime || cd ~/.vim_runtime && git pull
	vim +PluginInstall +qall
	ln -sfP $(DOTFILES)/config/vimrc ~/.vimrc
	ln -sfP $(DOTFILES)/config/uniemoji.json ~/.config/uniemoji/custom.json
	ln -sfP $(DOTFILES)/config/assh.yml ~/.ssh/assh.yml

gnome: yaourt
	rm -rf ~/Templates/*
	ln -sfP $(DOTFILES)/gnome/Templates/* ~/Templates/
	gsettings set org.gnome.desktop.interface show-battery-percentage true

yaourt: pacman
	yaourt -Syau  # Install any updates before extra packages
	yaourt -S `cat $(DOTFILES)/yaourt/packages.conf` --needed
	ln -sfP $(DOTFILES)/yaourt/.yaourtrc ~/.yaourtrc

pacman:
	gpg --recv-keys F7E48EDB  # Add custom key for ncurses
	sudo ln -sfP $(DOTFILES)/yaourt/pacman.conf /etc/pacman.conf
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58
	gpg --keyserver pool.sks-keyservers.net --recv-keys 2E1AC68ED40814E0  # gotta be a way to add to pacman, not my GPG

fonts: yaourt
	ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
	ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
	ln -s /etc/fonts/conf.avail/30-infinality-aliases.conf /etc/fonts/conf.d
	gdk-pixbuf-query-loaders --update-cache

.PHONY: apt bash bin config gnome yaourt pacman fonts
