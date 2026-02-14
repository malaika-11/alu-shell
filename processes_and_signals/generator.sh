#!/usr/bin/env bash

# Generator script to create all task scripts
# Each script will be executable and ShellCheck compliant

# 0-what-is-my-pid
cat << 'EOF' > 0-what-is-my-pid
#!/usr/bin/env bash
echo $$
EOF
chmod +x 0-what-is-my-pid

# 1-list_your_processes
cat << 'EOF' > 1-list_your_processes
#!/usr/bin/env bash
ps auxf
EOF
chmod +x 1-list_your_processes

# 2-show_your_bash_pid
cat << 'EOF' > 2-show_your_bash_pid
#!/usr/bin/env bash
# shellcheck disable=SC2009
ps aux | grep bash | grep -v grep
EOF
chmod +x 2-show_your_bash_pid

# 3-show_your_bash_pid_made_easy
cat << 'EOF' > 3-show_your_bash_pid_made_easy
#!/usr/bin/env bash
for pid in $(ls /proc | grep '^[0-9]*$'); do
    if [ -f "/proc/$pid/comm" ]; then
        name=$(cat "/proc/$pid/comm")
        if [ "$name" = "bash" ]; then
            echo "$pid $name"
        fi
    fi
done
EOF
chmod +x 3-show_your_bash_pid_made_easy

# 4-to_infinity_and_beyond
cat << 'EOF' > 4-to_infinity_and_beyond
#!/usr/bin/env bash
while true; do
    echo "To infinity and beyond"
    sleep 2
done
EOF
chmod +x 4-to_infinity_and_beyond

# 5-dont_stop_me_now
cat << 'EOF' > 5-dont_stop_me_now
#!/usr/bin/env bash
pkill -f 4-to_infinity_and_beyond
EOF
chmod +x 5-dont_stop_me_now

# 6-stop_me_if_you_can
cat << 'EOF' > 6-stop_me_if_you_can
#!/usr/bin/env bash
for pid in $(pgrep -f 4-to_infinity_and_beyond); do
    echo "Stopping PID $pid via /proc"
    echo 1 > "/proc/$pid/oom_score_adj" 2>/dev/null
done
EOF
chmod +x 6-stop_me_if_you_can

# 7-highlander
cat << 'EOF' > 7-highlander
#!/usr/bin/env bash
trap 'echo "I am invincible!!!"' SIGTERM
while true; do
    echo "To infinity and beyond"
    sleep 2
done
EOF
chmod +x 7-highlander

# 8-beheaded_process
cat << 'EOF' > 8-beheaded_process
#!/usr/bin/env bash
pkill -f 7-highlander
EOF
chmod +x 8-beheaded_process

# 10-process_and_pid_file
cat << 'EOF' > 10-process_and_pid_file
#!/usr/bin/env bash
PIDFILE="/var/run/myscript.pid"
echo $$ | sudo tee "$PIDFILE" > /dev/null

trap 'echo "I hate the kill command"' SIGTERM
trap 'echo "Y U no love me?!"' SIGINT
trap 'rm -f "$PIDFILE"; exit' SIGQUIT SIGTERM

while true; do
    echo "To infinity and beyond"
    sleep 2
done
EOF
chmod +x 10-process_and_pid_file

# 11-manage_my_process
cat << 'EOF' > 11-manage_my_process
#!/usr/bin/env bash
PIDFILE="/var/run/my_process.pid"

case "$1" in
    start)
        ./manage_my_process &
        echo $! > "$PIDFILE"
        echo "manage_my_process started"
        ;;
    stop)
        if [ -f "$PIDFILE" ]; then
            kill "$(cat "$PIDFILE")"
            rm -f "$PIDFILE"
        fi
        echo "manage_my_process stopped"
        ;;
    restart)
        if [ -f "$PIDFILE" ]; then
            kill "$(cat "$PIDFILE")"
            rm -f "$PIDFILE"
        fi
        ./manage_my_process &
        echo $! > "$PIDFILE"
        echo "manage_my_process restarted"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        ;;
esac
EOF
chmod +x 11-manage_my_process
