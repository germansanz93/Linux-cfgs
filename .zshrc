# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
#set background at sys start
feh --bg-scale /home/manjaro/Downloads/MQcz86.png


#functions
brightness() {
  input=$1;
  max_brigth=$(cat /sys/class/backlight/intel_backlight/max_brightness)
  echo "(${input}/100)*${max_bright}" | bc -l | awk -F. '{print $1}' | sudo tee /sys/class/backlight/intel_backlight/brightness
}

langes(){
  setxkbmap -layout es
}

langus(){
  setxkbmap -layout us
}

volume(){
  amixer -D pulse sset Master $1% 
}

wifid(){
  nmcli con down $(iwgetid -r)
}

wific(){
  nmcli con up $1
}

wifin(){
  wifid
  sudo nmcli dev wifi connect $1 password $2
}

wifil(){
  nmcli dev wifi list
}

bluetoothr(){
  bluetoothctl power off && bluetoothctl power on
}

bluetoothsr(){
  sudo systemctl start bluetooth && sudo systemctl enable bluetooth && bluetoothr
}

newCFile(){
  local header="/**\n* Programa: $1\n* Autor: $2\n* Fecha: $(date +'%Y-%m-%d')\n*/"
  echo $header > "./$1.c"
}

listContainers(){
  sudo docker ps -a | awk -F " " '{print $NF}' | grep -v "NAMES"
}

#my aliases
alias myscrot='scrot -s ~/Pictures/Screenshots/%b%d::%H%M%S.png'
