setopt nullglob
unsetopt auto_name_dirs 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:/opt/local/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# __rvm_project_rvmrc
