# Dylan's Xinitrc

# Source .Xresources
xrdb -merge ~/.Xresources

# Disable caps lock
setxkbmap -option caps:none

# Disable mousewheel as mine is fucked
# xinput set-button-map 10 1 2 3 0 0
# xinput disable 11

# Set up multi mon
# xrandr --output DVI-0 --mode 1920x1080 --rate 60 --primary --output HDMI-0 --mode 3840x2160 --rate 24 --below DVI-0 &
# xrandr --dpi 288

# Set wallpaper
feh --bg-fill /home/dyl/Pictures/bb1M3.jpg  &
# wall --loop 900 &


# options		root=PARTUUID=0311a22c-9dbb-4ece-9c1a-6a4e818da47d rw quiet loglevel=3 i915.enable_rc6=0 elevator=noop intel_idle.max_cstate=1

# urxvt daemon
urxvtd -q -f -o &

# bar
clock &
tint2 &
nm-applet &

# mpd
# mpd &
pulseaudio &

# Redshift
# redshift -m randr &

# Compton
# compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-mswc --unredir-if-possible --no-fading-openclose -o 0 -b

#  Start openbox
exec openbox-session
