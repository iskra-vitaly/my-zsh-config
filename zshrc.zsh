# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt walters
. ~/.zsh/Prompt/my.zsh
# . /etc/zsh_command_not_found

# aliases
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias grep='grep --color=auto'

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 9999 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=99999
SAVEHIST=99999
HISTFILE=~/.zsh_history

fpath=(~/.zsh/Completion $fpath)

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=long-list
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long-list
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

[[ $TERM == "xterm-kitty" ]] && { kitty + complete setup zsh | source /dev/stdin }

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# VCS_Info
autoload -Uz vcs_info

#java

[[ -x /usr/libexec/java_home ]] && export JAVA_HOME=`/usr/libexec/java_home`

# . ~/.zsh/my/play.zsh
# . ~/.zsh/my/freiminuten.zsh
# . ~/.zsh/my/theisland.zsh
# . ~/.zsh/my/asweb.zsh
# . ~/.zsh/my/psprt.zsh
#. ~/.zsh/my/gs46.zsh
# . ~/.zsh/my/univer.zsh
# . ~/.zsh/my/talentory.zsh
# . ~/.zsh/my/corgi.zsh
# . ~/.zsh/my/buzzprj.zsh
# . ~/.zsh/my/veep.zsh
# . ~/.zsh/my/mysql.zsh
# . ~/.zsh/my/tnf.zsh
# . ~/.zsh/my/psql.zsh

# stuff
source ~/.zsh/my/clj.zsh
source ~/.zsh/my/funcs.zsh
source ~/.zsh/my/droid.zsh

#rvm
source ~/.zsh/rvm-stuff/rc.zsh


PERL_MB_OPT="--install_base \"/Users/v_iskra/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/v_iskra/perl5"; export PERL_MM_OPT;

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

