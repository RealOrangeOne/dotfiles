DOTFILES=$(PWD)


install: apt bash bin config gnome yaourt
	chmod +x $(DOTFILES)/deploy.sh

bin:
	chmod +x $(DOTFILES)/bin/*

bash: yaourt
	ln -sfP $(DOTFILES)/bash/.bashrc ~/.bashrc
	mkdir -p ~/.nvm/
	ln -sfP /usr/share/nvm/init-nvm.sh ~/.nvm/nvm.sh

config:
	mkdir -p ~/.config/terminator
	ln -sfP $(DOTFILES)/config/terminator.conf ~/.config/terminator/config
	sudo ln -sfP $(DOTFILES)/config/libinput-gestures.conf /etc/libinput-gestures.conf

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

hot-fix:
	sudo ln -sfP /usr/bin/python2 /usr/bin/python  # Set the default python version to be python 2

.PHONY: apt bash bin config gnome yaourt pacman hot-fix
