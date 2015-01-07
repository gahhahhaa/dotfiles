export GOROOT=$HOME/go
export GOPATH=$HOME/gopath
export PATH=$GOROOT/bin:$PATH

autoload colors
colors
local p_cdir="%B%F{219}[%~]%f%b"$'\n'
local p_info="%F{yellow}%n%f%F{red}@%f%F{cyan}%m%f"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b "
export PROMPT="$p_cdir$p_info $p_mark"

## R PROMPT
local r_time="%F{244}%W%f %F{009}%T%f"
export RPROMPT="$r_time"

export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib

alias ls='ls --color=auto'

