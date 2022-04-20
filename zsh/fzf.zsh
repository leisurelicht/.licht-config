# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

if [ ! -d /opt/homebrew/opt/fzf/shell/zsh-interactive-cd ]; then
  git clone --depth 1 https://github.com/changyuheng/zsh-interactive-cd \
      /opt/homebrew/opt/fzf/shell/zsh-interactive-cd
fi
# Reinforce 'cd' command
source "/opt/homebrew/opt/fzf/shell/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh"

# Alias
# -----
# It's better to run 'brew install bat' first
alias fzf='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"'"

# Export configure
# ------
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'

export FZF_CTRL_T_OPTS='--height 60% --reverse --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_COMMAND="fd --type d --color=never"
