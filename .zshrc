# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
#時刻を表示させる
alias history='history -E'

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

eval "$(direnv hook zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Jump to
jump_kyotei() {
    cd /home/vagrant/Code/src/github.com/nekikara/kyotei_analysts
}
alias jkyotei='jump_kyotei'

# OPAM configuration
. /home/vagrant/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
