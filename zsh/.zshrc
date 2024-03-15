# ENV
export main="/Users/keitaro/Desktop/allProjects/Active"
export store="/Users/keitaro/Desktop/data_store"
export mamp="/Applications/MAMP/htdocs"
export sfc="/Users/keitaro/Desktop/sfc"

# PROMPT
PROMPT="%F{40}[%n]%f %F{64}%~%f
%# "
RPROMPT="%F{2}%T%f"

# git-completion
fpath=(~/dotfiles/git_plugin/ $fpath)
autoload -U compinit
compinit -u
