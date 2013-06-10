#!/usr/bin/zsh

setopt prompt_subst
autoload colors    
colors             
 
autoload -Uz vcs_info

# set some colors
for COLOR in RED GREEN YELLOW WHITE BLACK CYAN; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'        
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done                                                
PR_RESET="%{${reset_color}%}";

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stangedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository

FMT_BRANCH="${PR_BRIGHT_CYAN}%s${PR_RESET}:${PR_GREEN}%b%u%c${PR_RESET}" # e.g. master¹²
FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"   # e.g. (rebase-i)
FMT_PATH="%R${PR_YELLOW}/%S"              # e.g. ~/repo/subdir
FMT_OUTER_PATH="%R"
FMT_INNER_PATH="${PR_YELLOW}/%S${PR_RESET}"
 
# check-for-changes can be really slow.
# you should disable it, if you work with large repositories    
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'  # display ¹ if there are unstaged changes
zstyle ':vcs_info:*:prompt:*' stagedstr '²'    # display ² if there are staged changes
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}" "$FMT_OUTER_PATH"  "${FMT_INNER_PATH}" "$FMT_PATH"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}" "$FMT_OUTER_PATH" "${FMT_INNER_PATH}" "$FMT_PATH"
zstyle ':vcs_info:*:prompt:*' nvcsformats   "" "%~" "" "$FMT_PATH"
zstyle ':vcs_info:*:prompt:*' max-exports 4
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

function precmd {       
    vcs_info 'prompt'         
}

function lprompt {
    local brackets=$1
    local color1=$2  
    local color2=$3  
                      
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"         
                                                              
    local vc1='$vcs_info_msg_0_'
    local vc2='$vcs_info_msg_1_'
    local vc3='$vcs_info_msg_2_'
 
    PROMPT="%(?..[$PR_RED%?$PR_RESET] )${PR_RESET}[${vc1}]${bracket_open}${vc2}${vc3}${bracket_close}
%#${PR_RESET} "
}                                                                                        
 
function rprompt {
    local brackets=$1
    local color1=$2  
    local color2=$3  
                      
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"
    local colon="${color1}:"                               
    local at="${color1}@${PR_RESET}"                       
                                                             
    local user_host="${color1}%n${at}${color1}%m"                   
    local vcs_cwd='${${vcs_info_msg_3_%%.}/$HOME/~}'       
    local cwd="${color2}%30<..<${vcs_cwd}%<<"
    local inner="${user_host}${colon}$cwd"
 
    RPROMPT="${PR_RESET}${bracket_open}${inner}${bracket_close}${PR_RESET}"
}
 
lprompt '[]' $PR_BRIGHT_BLACK $PR_WHITE
rprompt '()' $PR_BRIGHT_BLACK $PR_WHITE

