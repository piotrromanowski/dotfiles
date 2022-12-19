if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/config --reload example &
  done
else
  polybar --config=~/.config/polybar/config --reload example &
fi
