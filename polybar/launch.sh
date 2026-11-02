#!/usr/bin/env bash

# Encerra qualquer instância anterior da Polybar
polybar-msg cmd quit 2>/dev/null || killall -q polybar

# Aguarda até que os processos sejam encerrados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Detecta os monitores e lança uma barra para cada um
if type "xrandr" > /dev/null; then
  for m in $(polybar -m | cut -d ":" -f 1); do
    MONITOR=$m polybar --reload superior &
  done
else
  polybar --reload superior &
fi
