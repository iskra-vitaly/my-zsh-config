#!/usr/bin/zsh

gs46_home=~/projects/gs46
gs46_prj=$gs46_home/gs46-web
gs46_ui=$gs46_prj/gs46-webui/ui

function gs46prj {
    cd $gs46_prj
}

function gs46ui {
    cd $gs46_ui
}

function gs46tomcat {
    cd $gs46_ui
    ../../../tomcat/bin/shutdown.sh
    rm -rf ../../../tomcat/webapps/ui/
    mvn install -P ru-prod-prod
    cp target/ui-3.0.39-SNAPSHOT.war ../../../tomcat/webapps/ui.war
    ../../../tomcat/bin/startup.sh
    less D:/tmp/gs46-web-3.0.39-SNAPSHOT.log
}

function gs46-clean {
   gs46prj
   cd gs46-webui
   mvn clean
   rm -rf ~/Library/Caches/MvnRepo/com/gs46
}

function cmd-once {
    cmd_str="$@"
    pgrep_cmd=(pgrep -f "$cmd_str")
    pids=($($pgrep_cmd))
    if [[ -z $pids ]]; then
        echo "[start] $@"
    else
        echo "[restart] $@"
        kill $pids
    fi
    $@
}

function map-inst {
    cmd-once ssh -fNL 3080:192.168.100.$1:28080  root@192.168.0.170
}

function map-34 {
    map-inst 34
}

function map-33 {
    map-inst 33
}

function map-gs-port {
    cmd-once ssh -fNL $1:192.168.$2:$3 root@192.168.0.170
}

function map-cluster-port {
    map-gs-port $1 "100.$2" $3 
}

function map-db-port {
    map-gs-port 1521 0.181 1521
}

function map-cluster-ports {
    map-cluster-port 18080 33 28080
    map-cluster-port 28080 34 28080
    map-cluster-port 19009 33 29009 
    map-cluster-port 29009 34 29009 
    map-cluster-port 2080 33 8080
    map-cluster-port 24848 33 4848
}
