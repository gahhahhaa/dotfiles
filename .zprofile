if [ -z "$PS1" ]; then return ; fi

if [ -z "$TMUX" ] ; then
        if [ -z `tmux ls` ] ; then
                tmux new-session \; source-file $HOME/dotfiles/.tmux/pane_partition
        else
                tmux 
        fi
fi

