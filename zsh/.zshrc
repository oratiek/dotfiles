# ENV
export main="/Users/keitaro/Desktop/allProjects/Active"
export store="/Users/keitaro/Desktop/data_store"
export mamp="/Applications/MAMP/htdocs"
export sfc="/Users/keitaro/Desktop/sfc"
export LC_CTYPE="ja_JP.UTF-8"

# ALIAS
alias python=python3.10

# git-completion
fpath=(~/dotfiles/git_plugin/ $fpath)
autoload -U compinit
compinit -u

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
PROMPT='%B%F{green}%n@$HOST%f%b %F{64}%~%f %F{cyan}$vcs_info_msg_0_%f
%# '
RPROMPT="%F{2}%T%f"


