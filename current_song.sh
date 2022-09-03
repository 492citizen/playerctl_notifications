MY_PATH="$(dirname $0)"/notify.sh
playerctl metadata --follow --format "{{artist}} - {{title}}" | bash $MY_PATH
