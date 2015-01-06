FROM ubuntu:14.04

## Install ssh
RUN apt-get update
RUN apt-get install -y openssh-server wget build-essential autoconf
RUN apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
RUN apt-get install -y gettext libncurses5-dev libacl1-dev libgpm-dev libperl-dev python-dev python3-dev ruby-dev lua5.2 liblua5.2-dev luajit libluajit-5.1 automake cproto
RUN apt-get install -y language-pack-ja manpages-ja
RUN apt-get install -y git mercurial
RUN export LANG=ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8

## Set Timezone
RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

## Install Git
RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN git clone git://git.kernel.org/pub/scm/git/git.git
WORKDIR git
RUN make configure
RUN ./configure --prefix=/usr/local
RUN make all
RUN make install

## Install Vim
WORKDIR /usr/local/src
RUN hg clone https://vim.googlecode.com/hg/ vim
WORKDIR vim/src
ADD vimigure.sh /usr/local/src/vim/src/vimigure.sh
RUN ./vimigure.sh
RUN make
RUN make install

## Install ZSH
WORKDIR /usr/local/src
RUN wget http://sourceforge.net/projects/zsh/files/zsh/5.0.5/zsh-5.0.5.tar.bz2/download
RUN file download
RUN tar jxf download
RUN rm -rf download
WORKDIR zsh-5.0.5/
RUN ./configure --with-tcsetpgrp
RUN make && make install

## Install Go1.3.1
WORKDIR /usr/local/src
RUN wget https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.3.1.linux-amd64.tar.gz

## Install Neobundle
RUN mkdir -p /home/nek/.vim/bundle
WORKDIR /home/nek/.vim/bundle
RUN git clone https://github.com/Shougo/neobundle.vim


## Install Ricty font
ADD ./RictyDiscord-Bold.ttf /home/nek/.fonts/RictyDiscord-Bold.ttf

## Change SHELL to Zsh
# root shell
RUN echo '/usr/local/bin/zsh' >> /etc/shells
RUN chsh -s /usr/local/bin/zsh
# user shell
RUN usermod -s /usr/local/bin/zsh nek

## Change Owner to nek
RUN chown -R nek /home/nek
RUN chgrp -R nek /home/nek

## Setting ssh
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
