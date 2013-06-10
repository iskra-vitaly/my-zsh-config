#!/usr/bin/zsh

play2_home=/home/vitalik/soft/play-2.1.1
play1_home=/home/vitalik/soft/play-1.2.5

function play2 {
	local conf_opt=""
	if [[ -f conf/dev-v-iskra.conf ]]
	then
		conf_opt="-Dconfig.file=conf/dev-v-iskra.conf"
	fi
	$play2_home/play $conf_opt $*
}

function playd {
	local conf_opt=""
	if [[ -f conf/dev-v-iskra.conf ]]
	then
		conf_opt="-Dconfig.file=conf/dev-v-iskra.conf"
	fi
	local cmd="$play2_home/play debug $conf_opt $*"
	echo $cmd...
	$=cmd
}

function play1 {
	$play1_home/play $*
}

function add_path_item {
    local item=$1
    if [[ -z "$path[(r)$item]" ]]; then
        path=($item $path)
    fi
}

add_path_item $play2_home
