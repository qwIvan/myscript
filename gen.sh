sh /tmp/test.sh LeadingPhonyAntarcticgiantpetrel.webm 1.gif 9 2.4
sh /tmp/test.sh LeadingPhonyAntarcticgiantpetrel.webm 2.gif 36.7 2.8
sh /tmp/test.sh LightSnappyFoxhound.webm 3.gif 0 3
sh /tmp/test.sh LightSnappyFoxhound.webm 4.gif 38.7 2.5
sh /tmp/test.sh LightSnappyFoxhound.webm 5.gif 55.3 2.6
gifsicle 1.gif 2.gif 3.gif 4.gif 5.gif -O3 --lossy=80 --colors 256 -o optimized.gif
