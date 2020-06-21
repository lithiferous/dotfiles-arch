#!/bin/zsh
# Profile file. Runs on login.

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH=~/.local/bin/:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/usr/lib/node_modules/:$PATH
export PATH=/usr/lib/jvm/default/bin/:$PATH
export PATH=$PATH:/opt/apache-spark/bin
export PATH=~/anaconda3/bin:$PATH
export PATH=/usr/bin/julia:$PATH

export GOPATH=$HOME/go
export SPARK_HOME=/opt/apache-spark
export HADOOP_CONF_DIR=/etc/hadoop/conf

export ATOM="atom"
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="ranger"
export LIB="libreoffice"
export READER="zathura"
export STATS="rstudio-bin"
export ALASCA="intellij-idea-ultimate"
export TERMINAL="st"
export VS='code'
export _JAVA_AWT_WM_NONREPARENTING=1

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm > /dev/null && exec startx
# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null
