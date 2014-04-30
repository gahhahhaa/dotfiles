#!/bin/bash

sudo ./configure --with-features=huge \
--enable-multibyte \
--enable-perlinterp \
--enable-python3interp \
--enable-rubyinterp \
--enable-luainterp=dynamic \
--with-lua-prefix=/usr \
--with-luajit \
--with-x \
--with-gnome \
--enable-xim \
--enable-fontset \
--disable-selinux \
--enable-fail-if-missing \
