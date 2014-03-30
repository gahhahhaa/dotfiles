# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

[ -s "/home/vagrant/.nvm/nvm.sh" ] && . "/home/vagrant/.nvm/nvm.sh" # This loads nvm

nvm use v0.10
