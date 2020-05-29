set --export SHELL /usr/bin/fish
set --export EDITOR "nvim"
set --export export NNN_OPENER=rifle
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
function reconnect
	bluetoothctl -- disconnect
	bluetoothctl -- power off
	sleep 2
	bluetoothctl -- power on
	sleep 1
	bluetoothctl -- connect 00:18:09:8D:CD:DD
end
set -e fish_greeting
export JAVA_HOME=/usr/lib/jvm/java-14-openjdk/

set -gx PATH $JAVA_HOME/bin $PATH

