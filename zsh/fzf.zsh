
# Reinforce 'cd' command
if [[ $(uname -s) == "Darwin" ]]; then
    if [ ! -d /opt/homebrew/opt/fzf/shell/zsh-interactive-cd ]; then
        git clone --depth 1 https://github.com/changyuheng/zsh-interactive-cd \
            /opt/homebrew/opt/fzf/shell/zsh-interactive-cd
    fi
    source "/opt/homebrew/opt/fzf/shell/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh"
fi

# Alias
# -----
# It's better to run 'brew install bat' first
alias fzf='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"'"

# Export configure
# ------
# export FZF_DEFAULT_OPTS='--height 60% --layout=reverse'
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'

export FZF_CTRL_T_OPTS='--height 60% --reverse --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_COMMAND="fd --type d --color=never"
