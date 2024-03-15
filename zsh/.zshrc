# ENV
export main="/Users/keitaro/Desktop/allProjects/Active"
export store="/Users/keitaro/Desktop/data_store"
export mamp="/Applications/MAMP/htdocs"
export sfc="/Users/keitaro/Desktop/sfc"

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
# PROMPT
PROMPT="%F{40}[%n]%f %F{64}%~%f
%# "

# プロンプトカスタマイズ
PROMPT='%F{40}[%n]%f %F{64}%~%f %F{cyan}$vcs_info_msg_0_%f
%# '
RPROMPT="%F{2}%T%f"


