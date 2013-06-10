#!/usr/bin/zsh

sam=~/projects/sam
cor_home=$sam/corgi
cor_src=$cor_home/src

function corhome {
    cd $cor_home
}

function corprj {
    cd $cor_src
}

function correm {
    cd $cor_home/nas/usr/share/corgi-nas
}
