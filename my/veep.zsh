#!/usr/bin/zsh

veep_home=/Users/v_iskra/projects/veep

function veep {
	cd $veep_home
}

function veepprj {
	cd "$veep_home/veep-core"
}

function start-veep {
	~/soft/glassfish4/glassfish/bin/asadmin start-domain veep
}

function stop-veep {
	 ~/soft/glassfish4/glassfish/bin/asadmin stop-domain veep
}

function veep-db {
	/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -d veep
}
