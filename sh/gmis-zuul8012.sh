#!/bin/sh
CMD=$1

jarpath=/root/insurance/syszuul
jarname=miscloud-zuul-0.0.1-SNAPSHOT.jar
jarport=8012

case $CMD in
-start)
        nohup java -jar $jarpath/$jarname > $jarpath/nohup.out &
        ;;
-stop)
        pid=$(sudo netstat -nlp | grep -w ':'$jarport |awk '{print $nf}' | sed -r 's#.* (.*)/.*#\1#')
        if [  -n  "$pid"  ];  then
		sudo kill $pid;
		fi
        ;;
-restart)
        pid=$(sudo netstat -nlp | grep -w ':'$jarport |awk '{print $nf}' | sed -r 's#.* (.*)/.*#\1#')
        if [  -n  "$pid"  ];  then
        sudo kill $pid;
        fi
        nohup java -jar $jarpath/$jarname > $jarpath/nohup.out &
        ;;
esac