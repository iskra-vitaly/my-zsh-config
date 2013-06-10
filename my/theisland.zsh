#!/usr/bin/zsh

tis_home=~/projects/theisland
motibu_home=~/projects/motibu
play_home="/home/vitalik/soft/play-1.2.5"
tis_bin=$tis_home/bin
tis_prj=$tis_home/theisland
motibu_prj=$motibu_home/motibu
tis_host=ns384333.ovh.net 

function add_tis_path_item {
    local item=$1
    if [[ -z "$path[(r)$item]" ]]; then
        path=($item $path)
    fi
}

add_tis_path_item $play_home
add_tis_path_item $tis_bin

function motprj {
    cd $motibu_prj
}

function tisprj {
    cd $tis_prj
}

function tisssh {
    ssh theisland@$tis_host $*
}

function tisdb {
    mysql -uroot -proot theisland
}
