#!/bin/bash
CW_PATH="${CW_PATH:-$HOME/.local/share/clipwatch}"

mkdir -p $CW_PATH
test -f "$CW_PATH/old" || touch "$CW_PATH/old"
test -f "$CW_PATH/history" || touch "$CW_PATH/history"

while true;
do
	OLD=`cat $CW_PATH/old`
	NEW=`xclip -sel clip -o`
	test "$OLD" = "$NEW" || (xclip -sel clip -o | base64 >> $CW_PATH/history && xclip -sel clip -o > $CW_PATH/old | base64 && echo $NEW)
	sleep 1
done
