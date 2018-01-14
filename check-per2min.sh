#!/system/bin/sh
if ! busybox ps | grep -v grep | grep /data/per2min;then
su -c /data/per2min &
fi
