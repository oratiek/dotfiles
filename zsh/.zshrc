# ENV
export main=~/Desktop/projects/
export LC_CTYPE="ja_JP.UTF-8"
export PATH=~/dotfiles/scripts:$PATH
export python=python3


setopt HIST_IGNORE_SPACE

# direnv
eval "$(direnv hook zsh)"

# ALIAS
alias python='eval $python'
alias cpu='sensors | grep CPU'
alias rm='trash-put'
alias bat='batcat'
alias tm='tmux'

# git-completion
fpath=($(pwd)/zsh/git_plugin/ $fpath)
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

# gitignore gen command
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}

bindkey -e

export PATH=$PATH:$HOME/dotfiles/bin
