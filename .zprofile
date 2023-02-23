#!/bin/sh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export PATH=/home/stylish/.local/bin:$PATH
export PATH=/home/stylish/.local/share/npm/bin:$PATH
export EDITOR=vim
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export CARGO_HOME=$XDG_DATA_HOME/cargo
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine
export _Z_DATA=$XDG_DATA_HOME/z
export ASDF_DIR=$XDG_DATA_HOME/asdf
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
export SDKMAN_DIR=$XDG_DATA_HOME/sdkman
