if (( $+commands[yarn] )); then
  export PATH="$(yarn global bin 2>/dev/null):$PATH"
fi

export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH"
export NPM_CONFIG_FUND=false

# This is a private CLI, you can ignore this file
# Issue with following producing error:
#   /Users/mikekilmer/.dotfiles/config/node.zsh:11: permission denied: dev
#   compdef: unknown command or service: dev
#if (( $+commands[dev] )); then
#  source <(dev completion script)
#  alias d=dev
#  compdef d=dev
#fi
