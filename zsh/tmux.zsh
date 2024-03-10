if [ -z "$TMUX" ] && [[ "$TERM" =~ "xterm" ]]; then
    if [ -e /usr/share/terminfo/*/xterm-256color ]; then
        export TERM='xterm-256color'
    else
        export TERM='xterm-color'
    fi
elif [ -n "$TMUX" ]; then
    if [ -e /usr/share/terminfo/*/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi