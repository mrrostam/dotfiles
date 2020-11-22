#!/usr/bin/env bash

# xinitrc-common : copy of /etc/X11/xinit/xinitrc-common
# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
# I decided to copy this file instead of sourcing it just for the
# discoverability / ease of learning that having the file here in plain text
# provides.
#
# This is common code shared by both Xsession and xinitrc scripts.  Be sure
# to take this into account when fixing bugs or adding new functionality.

# Set up i18n environment
if [ -r /etc/profile.d/lang.sh ]; then
  . /etc/profile.d/lang.sh
fi

# shellcheck source=/dev/null
[ -r "${HOME}/.profile" ] && . "${HOME}/.profile"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxkbmap=$HOME/.Xkbmap

sysresources=/etc/X11/Xresources
sysmodmap=/etc/X11/Xmodmap
sysxkbmap=/etc/X11/Xkbmap

# merge in defaults
[ -r "$sysresources" ] && xrdb -nocpp -merge "$sysresources"
[ -r "$userresources" ] && xrdb "-I$HOME" -merge "$userresources"

# merge in keymaps
[ -r "$sysxkbmap" ] && setxkbmap $(cat "$sysxkbmap")
[ -r "$userxkbmap" ] && setxkbmap $(cat "$userxkbmap")

# xkb and xmodmap don't play nice together
if ! [ -r "$sysxkbmap" ] && ! [ -r "$userxkbmap" ] ; then
    [ -r "$sysmodmap" ] && xmodmap "$sysmodmap"
    [ -r "$usermodmap" ] && xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  # shellcheck source=/dev/null
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Prefix launch of session with ssh-agent if available and not already running.
if [ -z "$SSH_AGENT" ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ] && [ -x /usr/bin/ssh-agent ]; then
    if [ "x$TMPDIR" != "x" ]; then
        SSH_AGENT="/usr/bin/ssh-agent /bin/env TMPDIR=$TMPDIR"
    else
        SSH_AGENT="/usr/bin/ssh-agent"
    fi
fi

# Setup GIT_ASKPASS env if not set from a sensible list
if [ -z "$GIT_ASKPASS" ]; then
    for askpass in "$GIT_ASKPASS" ksshaskpass ssh-askpass-gnome x11-ssh-askpass ssh-askpass; do
        if command -v "$askpass" > /dev/null 2>&1; then
            export GIT_ASKPASS="$askpass"
            break
        fi
    done
fi

GPG_TTY="$(tty)"
export GPG_TTY

# Here simple xterm is kept as default
default_session="xmonad"
session=$1

if [ -z "$session" ] ; then
    if [ -n "$WANTED_SESSION" ]; then
        session="$WANTED_SESSION"
    else
        session="$default_session"
    fi
fi

case $session in
    i3|i3wm           )
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"
        # All startup is managed in i3/config
        exec $SSH_AGENT i3
        ;;
    qtile             )
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"

        # Export the values of interface names
        # shellcheck source=/dev/null
        [ -r "${HOME}/bin/export_network_names.sh" ] && \
	    . "${HOME}/bin/export_network_names.sh"
        # All startup is managed in qtile/autostart.sh
        # This is called in the startup_once hook
        exec $SSH_AGENT qtile
        ;;
    awesome           )
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"

        # Export the values of interface names
        # shellcheck source=/dev/null
        [ -r "${HOME}/bin/export_network_names.sh" ] && \
	    . "${HOME}/bin/export_network_names.sh"
        # All startup is managed in Awesome lua files
        exec $SSH_AGENT awesome
        ;;
    bspwm             )
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"

        # A fifo in case for panels like Lemonbar
        export PANEL_FIFO="/tmp/panel-fifo"
        # All startup is managed in bspwm/bspwmrc
        exec $SSH_AGENT bspwm
        ;;
    xmonad            )
        # Export useful variables for theming GUI apps
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"

        # Start session applications
        # Power management
        xfce4-power-manager &
        # Compositor
        compton -b --conf "${HOME}/.config/compton.conf"
        # Locker
        xss-lock -n "${HOME}/bin/dim-screen.sh" -- "${HOME}/bin/i3lock-laptop.sh" &

        # Tray and notifications
        dunst &

        # NM applet
        if command -v nm-applet >/dev/null 2>&1 ; then
            nm-applet --sm-disable &
        fi

        # Wallpaper
        # shellcheck source=/dev/null
        [ -r "${HOME}/.fehbg" ] && . "${HOME}/.fehbg"

        exec $SSH_AGENT xmonad
        ;;
    kde|plasma        )
        exec $SSH_AGENT startplasma-x11
        ;;
    xfce|xfce4        )
        exec $SSH_AGENT startxfce4
        ;;
    sway              )
        export QT_QPA_PLATFORMTHEME="qt5ct"
        export GTK_THEME="Arc-Dark"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"
        exec $SSH_AGENT sway
        ;;
    # No known session, try to run it as command ;
    # useful for starting programs without WM
    *                 ) exec "$1";;
esac
