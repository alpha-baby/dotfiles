# https://github.com/ohmyzsh/ohmyzsh/issues/31#issuecomment-359728582
unsetopt nomatch
if [ -z "$TMUX" ] && [[ "$TERM" =~ "xterm" ]]; then
    if [ -e /usr/share/terminfo/*/xterm-256color ] || [ -e /lib/terminfo/*/xterm-256color ]; then
        export TERM='xterm-256color'
    else
        export TERM='xterm-color'
    fi
elif [ -n "$TMUX" ]; then
    if [ -e /usr/share/terminfo/*/screen-256color ] || [ -e /lib/terminfo/*/xterm-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi
setopt nomatch