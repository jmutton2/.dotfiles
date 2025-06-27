#!/bin/bash
arg="${1:-}"
case "$arg" in
  --headphones)
    SINK="alsa_output.usb-Blue_Microphones_Yeti_Stereo_Microphone_REV8-00.iec958-stereo"
    pacmd set-default-sink "$SINK"
    pacmd list-sink-inputs | grep index | while read line; do
      pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send -t 1000 "Switched to headphones!"
    ;;
  --speakers)
    SINK="bluez_sink.40_EF_4C_84_07_C1.a2dp_sink"
    pacmd set-default-sink "$SINK"
    pacmd list-sink-inputs | grep index | while read line; do
      pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send -t 1000 "Switched to speakers!"
    ;;
  *)
esac
