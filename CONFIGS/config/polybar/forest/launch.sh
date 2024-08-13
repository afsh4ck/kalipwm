#!/usr/bin/env bash

# Ruta al directorio de configuración de Polybar
dir="$HOME/.config/polybar/forest"

launch_bar() {
    # Terminar cualquier instancia existente de Polybar
    killall -q polybar

    # Esperar a que los procesos se cierren
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Detectar el monitor interno y externo
    INTERNAL_MONITOR="eDP-1"
    EXTERNAL_MONITOR=$(xrandr --query | grep " connected" | grep -v "$INTERNAL_MONITOR" | awk '{ print $1 }')

    if [ "$EXTERNAL_MONITOR" ]; then
        # Si hay un monitor externo, lanzar la barra en el monitor externo
        MONITOR=$EXTERNAL_MONITOR polybar -q main -c "$dir/config.ini" &
    else
        # Si no hay un monitor externo, lanzar la barra en el monitor interno
        MONITOR=$INTERNAL_MONITOR polybar -q main_internal -c "$dir/config.ini" &
    fi
}

launch_bar