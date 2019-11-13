FROM archlinux

RUN pacman -Sy \
	&& echo -e "" >> /etc/pacman.conf \
	&& echo -e "[archlinuxcn]" >> /etc/pacman.conf \
	&& echo -e "SigLevel = Optional TrustedOnly" >> /etc/pacman.conf \
	&& echo -e "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf \
	&& pacman -Syyu \
	&& pacman -S archlinuxcn-keyring \
	&& pacman -Syyu \
	&& pacman -Syy \
	&& curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& yes | pacman -S git \
	&& yes | pacman -S python3 \
	&& yes | pacman -S python-pip \
  	&& yes | pacman -S python2-pip \
	&& yes | pacman -S neovim \
	&& yes | pacman -S ctags \
	# && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	&& cd /home/ \
	#&& git clone https://github.com/xiaolitongxue666/Tools.git \
	&& git clone https://github.com/xiaolitongxue666/NeovimConfigFile.git \
	&& mkdir -p /root/.config/nvim \
	&& cp /home/NeovimConfigFile/* /root/.config/nvim \
	&& python3 -m pip install pynvim \
	&& pip3 install requests \
	&& pip3 install pynvim \
	&& pip3 install neovim \
	&& pip3 install --upgrade neovim \
	&& pip2 install --upgrade neovim \
	&& python3 -m pip install pynvim\
	&& yes | pacman -S ruby \
	&& yes | pacman -S nodejs \
	&& gem install neovim
	&& nvim +'PlugInstall --sync' +qa \
	#&& nvim --headless +PlugInstall +qa \
	&& yes | pacman -Sc
