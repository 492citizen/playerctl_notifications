#! /usr/bin/bash

ART_PATH=$(dirname $0)/art.png

while read line
do
	artUrl="$(playerctl metadata mpris:artUrl)"


	if [[ $artUrl =~ ^http.* ]]; then
		echo "Downloading from web"
		wget $artUrl -O $ART_PATH --quiet
	else
		echo "Copying from local"
		cp "$(echo $artUrl | sed -e "s.file://..")" $ART_PATH
	fi

	printf "IMG:$ART_PATH\t$(echo $line)" | xnotify -m 10 -G NE -g 500x0-10+35 -s 5 &

done
