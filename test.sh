#!/bin/sh

palette="/tmp/palette.png"

filters="fps=10,scale=800:-1:flags=lanczos"

ffmpeg -ss $3 -t $4 -v warning -i $1 -vf "$filters,palettegen=stats_mode=diff" -y $palette

ffmpeg -ss $3 -t $4 -i $1 -i $palette -lavfi "$filters,paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" -y $2
