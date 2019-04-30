#!/bin/ash
echo "Starting JJMumbleBot..."

SERVER_IP=${ADDRESS:-localhost}
PASSWORD=${PASSWORD:-password}
PORT_NUMBER=${PORT:-64738}
DEFAULT_CHANNEL_NAME=${CHANNEL:-default}
USERNAME=${BOTNAME:-jjmumblebot}

sed "s|SERVER_IP|$SERVER_IP|;
     s|PASSWORD|$PASSWORD|;
     s|PORT_NUMBER|$PORT_NUMBER|;
     s|DEFAULT_CHANNEL_NAME|$DEFAULT_CHANNEL_NAME|;
     s|USERNAME|$USERNAME|;
     s|CERT_FILE_PATH|/data/cert/cert.pem|;
     s|TEMP_IMG_DIR_PATH|/data/tmp|;
     s|PERM_MEDIA_DIR_PATH|/data/media|;
     s|VLC_PATH|vlc|;
     s|PLUGINS_DIR_PATH|plugins|;
     s|LOGS_DIR_PATH|/data/logs|;" \
     templates/sample_config.ini > config.ini

python3 .
