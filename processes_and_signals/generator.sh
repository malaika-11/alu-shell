#!/usr/bin/env bash

case "$1" in

# 0. Display own PID
0)
    echo "$$"
;;

# 1. List all processes (hierarchy, all users, no TTY required)
1)
    ps auxf
;;

# 2. Show Bash PID (no pgrep allowed)
2)
    # shellcheck disable=SC2009
    ps auxf | grep bash | grep -v grep
;;

# 3. Show Bash PID made easy (no ps allowed)
3)
    pgrep -l bash
;;

# 4. To infinity and beyond
4)
    while true
    do
        echo "To infinity and beyond"
        sleep 2
    done
;;

# 5. Stop 4 using kill
5)
 PID=$(pgrep -f "generator.sh 4")

    if [ -n "$PID" ]; then
        kill "$PID"
    else
        echo "Process not running"
    fi
;;
# 6. Stop 4 without kill or killall
6)
    pkill -f "processes_and_signals.sh 4"
;;

# 7. Highlander
7)
    trap 'echo "I am invincible!!!"' SIGTERM

    while true
    do
        echo "To infinity and beyond"
        sleep 2
    done
;;

# 67. Stop highlander (like 67-stop_me_if_you_can)
67)
    pkill -f "processes_and_signals.sh 7"
;;

# 8. Beheaded process (force kill highlander)
8)
    pkill -9 -f "processes_and_signals.sh 7"
;;

# 9 / 10. Process and PID file
10)
    PIDFILE="/var/run/myscript.pid"
    echo "$$" | sudo tee "$PIDFILE" > /dev/null

    trap 'echo "I hate the kill command"' SIGTERM
    trap 'echo "Y U no love me?!"' SIGINT
    trap 'rm -f "$PIDFILE"; exit' SIGQUIT SIGTERM

    while true
    do
        echo "To infinity and beyond"
        sleep 2
    done
;;

# 11. Manage my process (init-style)
start)
    nohup bash -c 'while true; do echo "I am alive!" >> /tmp/my_process; sleep 2; done' \
        > /dev/null 2>&1 &
    echo $! | sudo tee /var/run/my_process.pid > /dev/null
    echo "manage_my_process started"
;;

stop)
    if [ -f /var/run/my_process.pid ]; then
        sudo kill "$(cat /var/run/my_process.pid)"
        sudo rm -f /var/run/my_process.pid
        echo "manage_my_process stopped"
    fi
;;

restart)
    if [ -f /var/run/my_process.pid ]; then
        sudo kill "$(cat /var/run/my_process.pid)"
        sudo rm -f /var/run/my_process.pid
    fi
    nohup bash -c 'while true; do echo "I am alive!" >> /tmp/my_process; sleep 2; done' \
        > /dev/null 2>&1 &
    echo $! | sudo tee /var/run/my_process.pid > /dev/null
    echo "manage_my_process restarted"
;;

*)
    echo "Usage:"
    echo "./processes_and_signals.sh {0|1|2|3|4|5|6|7|67|8|10|start|stop|restart}"
;;

esac
