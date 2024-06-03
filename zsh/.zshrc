# ENV
export main=~/Desktop/projects/
export LC_CTYPE="ja_JP.UTF-8"
export PATH=~/dotfiles/scripts:$PATH
export python=python3.10
export note=~/Desktop/note/index.md
export main=~/Desktop/projects
export EDITOR=vim
# direnv
eval "$(direnv hook zsh)"

# ALIAS
alias python='eval $python'
alias cpu='sensors | grep CPU'
alias rm='trash-put'
alias bat='batcat'
alias vimf='vim $(fzf)'

# git-completion
fpath=(~/dotfiles/git_plugin/ $fpath)
autoload -U compinit
compinit -u

# linux brew
#eval "$(/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH=/home/keitaro/Desktop/projects/terminal-tweet/bin:$PATH
export TWI_LOGDIR=/home/keitaro/Desktop/projects/terminal-tweet/logs

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

bindkey -e
