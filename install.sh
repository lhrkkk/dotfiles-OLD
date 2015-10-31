#!/bin/sh
# todo: 这里仍然是用.yadr目录.
if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
    git clone --depth=1 https://github.com/lhrkkk/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "YADR is already installed"
fi
