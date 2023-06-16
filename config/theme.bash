#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

# Used by `macos-theme`

hour="$(date +'%H')"
walls="$HOME/Sync/Wallpapers"
case "$hour" in
'00') walls="$walls/Night" ;;
'01') walls="$walls/Night" ;;
'02') walls="$walls/Night" ;;
'03') walls="$walls/Night" ;;
'04') walls="$walls/Night" ;;
'05') walls="$walls/Morning" ;; # dawn
'06') walls="$walls/Morning" ;;
'07') walls="$walls/Morning" ;;
'08') walls="$walls/Morning" ;;
'09') walls="$walls/Day" ;; # day
'10') walls="$walls/Day" ;;
'11') walls="$walls/Day" ;;
'12') walls="$walls/Day" ;;
'13') walls="$walls/Day" ;;
'14') walls="$walls/Day" ;;
'15') walls="$walls/Day" ;;
'16') walls="$walls/Day" ;;
'17') walls="$walls/Evening" ;; # dusk
'18') walls="$walls/Evening" ;;
'19') walls="$walls/Evening" ;;
'20') walls="$walls/Evening" ;;
'21') walls="$walls/Night" ;; # night
'22') walls="$walls/Night" ;;
'23') walls="$walls/Night" ;;
'24') walls="$walls/Night" ;;
esac

WALLPAPER_DIRECTORY_LIGHT="$walls"
WALLPAPER_DIRECTORY_DARK="$walls"

VSCODE_THEME_LIGHT='Default Light+'
VSCODE_THEME_DARK='Popping and Locking'
