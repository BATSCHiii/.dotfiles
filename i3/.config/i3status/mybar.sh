#!/bin/bash

# yoinked from https://en.jeffprod.com/blog/2020/create-your-own-i3-sway-status-bar/
bg_bar_color="#282A36"

# Print a left caret separator
# @params {string} $1 text color, ex: "#FF0000"
# @params {string} $2 background color, ex: "#FF0000"
separator() { echo -n "{"
  echo -n "\"full_text\":\"\ue0b2\"," 
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"$bg_bar_color\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\""
  echo -n "}"
}

common() {
  echo -n "\"border\": \"$bg_bar_color\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0"
}


mydate() {
  local bg="#E0E0E0"
  separator $bg "#546E7A"
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\"  $(date "+%a %d.%m.%y %H:%M") \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

weather() {
  local bg="#546E7A"
  separator $bg "#3949AB"
  echo -n ",{"
  echo -n "\"name\":\"id_weather\","
  echo -n "\"full_text\":\" $(/home/melf/.dotfiles/i3/.config/i3status/weather.sh) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}


logout() {
  echo -n "{"
  echo -n "\"name\":\"id_logout\","
  echo -n "\"full_text\":\"  \","
  echo -n "\"background\":\"$bg_bar_color\","
  common
  echo -n "}" # <- Last item has no ,
}


memory() {
  echo -n ",{" # <- First item has no ,
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\"  $(/home/melf/.dotfiles/i3/.config/i3status/memory.py)\","
  echo -n "\"background\":\"#3949AB\","
  common
  echo -n "}"
}

battery() {
  separator "#3949AB" $bg_bar_color
  echo -n ",{" # <- First item has no ,
  echo -n "\"name\":\"id_battery\","
  echo -n "\"full_text\":\"   $(/home/melf/.dotfiles/i3/.config/i3status/battery.py)\","
  echo -n "\"background\":\"#3949AB\","
  common
  echo -n "}"
}


cpu_usage() {
  echo -n ",{"
  echo -n "\"name\":\"id_cpu_usage\","
  #echo -n "\"full_text\":\"   $(/home/melf/.dotfiles/i3/.config/i3status/cpu.py)% \","
  echo -n "\"full_text\":\"  $(/home/melf/.dotfiles/i3/.config/i3status/cpu.py) \","
  echo -n "\"background\":\"#3949AB\","
  common
  echo -n "},"
}

# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1, "click_events":true }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

# Now send blocks with information forever:
(while :;
do
	echo -n ",["
    battery
	memory
	cpu_usage
	weather
	mydate
	logout 
	echo "]"
	sleep 10
done) &

# click events
while read line;
do
  if [[ $line == *"name"*"id_logout"* ]]; then
    xfce4-terminal --command="i3-nagbar -t warning -m 'Log out ?' -b 'yes' 'i3-msg exit' > /dev/null"
  fi
done
