FROM archlinux

# Start build image
RUN \
# Config pacman archlinux china packer source and keyring
	pacman -Sy \
	&& echo -e "" >> /etc/pacman.conf \
	&& echo -e "[archlinuxcn]" >> /etc/pacman.conf \
	&& echo -e "SigLevel = Optional TrustedOnly" >> /etc/pacman.conf \
	&& echo -e "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf \
	&& yes | pacman -Syyu \
	&& yes | pacman -S archlinuxcn-keyring \
	&& pacman -Syy \
# Install common software
	&& yes | pacman -S git \
	&& yes | pacman -S gcc \
	&& yes | pacman -S make \
# Install software for neovim	
	&& curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& yes | pacman -S neovim \
# Clone neovim config and put to the right place
	&& cd /home/ \
	&& git clone https://github.com/xiaolitongxue666/NeovimConfigFile.git \
	&& mkdir -p /root/.config/nvim \
	&& cp /home/NeovimConfigFile/* /root/.config/nvim \	
# Install software for neovim plug
	&& yes | pacman -S python2 \	
	&& yes | pacman -S python3 \
	&& yes | pacman -S python-pip \
  	&& yes | pacman -S python2-pip \
	&& yes | pacman -S ctags \
	&& python3 -m pip install pynvim \
	&& pip3 install neovim \
	&& pip2 install --upgrade neovim \
# Install software for neovim checkhealth	
	# && yes | pacman -S ruby \
	# && yes | pacman -S nodejs \
	# && gem install neovim \
# Install neovim plug on terminal	
	&& nvim +'PlugInstall --sync' +qa \
# Clear all install packets	
	&& yes | pacman -Sc