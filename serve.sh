
#!/bin/bash

PORT=8000
HOST="127.0.0.1"

echo "================================"
echo "       SPACE EXPLORER SERVER"
echo "================================"

if ! command -v python >/dev/null 2>&1; then
    echo "[ERROR] Python is not installed!"
    exit 1
fi

if [ ! -f "index.html" ]; then
    echo "[ERROR] index.html not found!"
    exit 1
fi

echo ""
echo "[SERVER] Starting server..."
echo "[URL] http://$HOST:$PORT"
echo ""
echo "Press CTRL+C to stop the server."

python -m http.server "$PORT" --bind "$HOST"
