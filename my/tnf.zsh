#!/usr/bin/zsh

tnf_home=~/projects/tnf


function tnfprj() {
	cd $tnf_home
}

function activator {
	print -l $*
	(~/soft/activator-1.2.2-minimal/activator $*)
}
