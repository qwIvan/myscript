#!/bin/sh

mp42gif(){
  palette="/tmp/palette.png"
  filters="fps=19,scale=1280:-1:flags=lanczos"
  ffmpeg -ss $3 -t $4 -v warning -i $1 -vf "$filters,palettegen=stats_mode=diff" -y $palette
  ffmpeg -ss $3 -t $4 -i $1 -i $palette -lavfi "$filters,paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" -y $2
}

mp42gif LeadingPhonyAntarcticgiantpetrel.webm 1.gif 9 2.4
mp42gif LeadingPhonyAntarcticgiantpetrel.webm 2.gif 36.7 2.8
mp42gif LightSnappyFoxhound.webm 3.gif 0 3
mp42gif LightSnappyFoxhound.webm 4.gif 38.7 2.5
mp42gif LightSnappyFoxhound.webm 5.gif 55.3 2.6
gifsicle --crop 560,0+-250x-400 1.gif 2.gif 3.gif 4.gif 5.gif -O3 --lossy=8 -o optimized-yang.gif
mp42gif 2692159-1080p.mp4 6.gif 4:3.8 4.6
mp42gif 2692159-1080p.mp4 7.gif 4:53 2
mp42gif 2692159-1080p.mp4 8.gif 13:32.9 1.5
mp42gif 2692159-1080p.mp4 9.gif 15:3.7 1.3
mp42gif 2692159-1080p.mp4 10.gif 16:21.3 1.7
gifsicle --crop 560,0+-250x-400 6.gif 7.gif 8.gif 9.gif 10.gif -O3 --lossy=8 -o optimized-src.gif
ls -hl optimized-yang.gif optimized-src.gif
