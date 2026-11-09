#!/data/data/com.termux/files/usr/bin/bash

APP_DIR="$HOME/apps/demo"

cd "$APP_DIR" || exit 1

if [ -f app.pid ]; then
    PID=$(cat app.pid)

    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"
        sleep 2
    fi

    rm -f app.pid
fi

nohup node app.js > app.log 2>&1 < /dev/null &

echo $! > app.pid

echo "Application deployed."
echo "PID: $(cat app.pid)"
