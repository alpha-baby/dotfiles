if [ -z "$TMUX" ] && [[ "$TERM" =~ "xterm" ]]; then
    if [ -e /usr/share/terminfo/*/xterm-256color ]; then
        echo "1"
        export TERM='xterm-256color'
    else
        echo "2"
        export TERM='xterm-color'
    fi
elif [ -n "$TMUX" ]; then
    if [ -e /usr/share/terminfo/*/screen-256color ]; then
        echo "3"
        export TERM='screen-256color'
    else
        echo "4"
        export TERM='screen'
    fi
fi