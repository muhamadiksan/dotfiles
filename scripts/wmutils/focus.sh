#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# window focus wrapper that sets borders and can focus next/previous window

bw=6 # border width
active=$white # active border color
inactive=c0c0c0 # inactive border color

# get current window id
cur=$(pfw)

usage() {
    echo "usage: $(basename $0) <next|prev|wid>"
    exit 1
}

setborder() {
    # check if window exists
    wattr $2 || return

    # do not modify border of fullscreen windows
    test "$(wattr xywh $2)" = "0 0 1920 1080" && return

    case $1 in
        active)   chwb -s $bw -c $active $2 ;;
        inactive) chwb -s $bw -c $inactive $2 ;;
    esac
}

case $1 in
    next) wid=$(lsw | grep -v $cur | sed '1 p;d') ;;
    prev) wid=$(lsw | grep -v $cur | sed '$ p;d') ;;
    0x*) wattr $1 && wid=$1 ;;
    *) usage ;;
esac

# exit if we can't find another window to focus
test -z "$wid" && echo "$(basename $0): can't find a window to focus" >&2 && exit 1

setborder inactive $cur # set inactive border on current window
setborder active $wid   # activate the new window
wtf $wid                # set focus on it