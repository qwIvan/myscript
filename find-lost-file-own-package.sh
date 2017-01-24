ls /usr/bin/*(.) | xargs pacman -Qo 2>&1 | grep -oP '没有软件包拥有 \K(.*)$' | grep -o '[^\/]*$' | xargs -n1 pkgfile
