#!/bin/bash
export DISPLAY=:0
/usr/bin/wmctrl -x -a "ghostty" 2>~/scripts/nav/focus_ghostty_errors.log
