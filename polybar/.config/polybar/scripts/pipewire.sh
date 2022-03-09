#!/usr/bin/bash

VOLUME_ICONS=("" "")
MUTED_ICON=""
MUTED_COLOR="%{F#6b6b6b}"
VOLUME=2


output() {
    VOLUME=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Volume/ s!^[[:space:]]\+Volume:.* \([[:digit:]]\+\)%.*!\1!p" | head -n1)
    DEFAULT_SINK=$(pw-play --list-targets | sed -ne '1d' -e '/*/p' | grep -o '".*"' | tr -d '"')
    IS_MUTED=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Mute/ s/Mute: \(yes\)/\1/p")

    if [ "${IS_MUTED}" != "" ]; then
        echo "${MUTED_COLOR}${MUTED_ICON}"
    else
        if [ "${VOLUME}" -le '40' ]; then
            printf '%s ' "${VOLUME_ICONS[0]}"
        elif [ "${VOLUME}" -gt '40' ]; then
            printf '%s ' "${VOLUME_ICONS[1]}"
        fi

        echo "${VOLUME}%"
    fi

}
action=$1
if [ "${action}" == "volume-up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +$VOLUME%
    canberra-gtk-play -i audio-volume-change -d "changeVolume"
elif [ "${action}" == "volume-down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -$VOLUME%
    canberra-gtk-play -i audio-volume-change -d "changeVolume"
elif [ "${action}" == "toggle-mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ "${action}" == "next-sink" ]; then
    switch-sink 'next'
elif [ "${action}" == "previous-sink" ]; then
    switch-sink "previous"
fi

if [ -n "$action" ]; then exit 0; fi

pactl subscribe 2>/dev/null | {
    while :; do
        {
            output
        }
done
}


