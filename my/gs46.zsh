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
