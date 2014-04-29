if [ -z "$PS1" ]; then return ; fi

if [ -z $TMUX ] ; then
        if [ -z `tmux ls` ] ; then
                tmux
        else
                tmux attach
        fi
fi

