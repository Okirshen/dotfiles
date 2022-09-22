typeset -U PATH path

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export CARGO_HOME="$HOME"/.cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export WINEPREFIX="$XDG_DATA_HOME"/wine

export SPICETIFY_INSTALL="/home/okirshen/.spicetify"
export PATH="$PATH:/home/okirshen/.spicetify"
