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

export PATH=$HOME/bin:$PATH

export GOPATH=$HOME/projects
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export CARGO_PATH=$HOME/.cargo
export PATH=$CARGO_PATH/bin:$PATH

export RUST_SRC_PATH=$HOME/rust/src
export ANDROID_HOME=/Users/KEN/Library/Android/sdk
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools:$PATH
export PATH=$JAVA_HOME/bin:$PATH

