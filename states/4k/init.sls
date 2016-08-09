4k-xresources:
    file.blockreplace:
        - name: {{ grains.homedir }}/.Xresources
        - marker_start: "! 4kFilter"
        - marker_end: "! /4kFilter"
        - content: 'Xft.dpi: 220'
        - show_changes: True

4k-i3-config-i3bar:
    file.blockreplace:
        - name: {{ grains.homedir }}/.config/i3/config
        - marker_start: "# 4kFilterBar"
        - marker_end: "# /4kFilterBar"
        - content: "\theight 48\n\tfont pango:Hack 10"
        - show_changes: True

4k-i3-config-font:
    file.blockreplace:
        - name: {{ grains.homedir }}/.config/i3/config
        - marker_start: "# 4kFilterFont"
        - marker_end: "# /4kFilterFont"
        - content: "\tfont pango:Hack 10"
        - show_changes: True

4k-i3-config-dpi:
    file.blockreplace:
        - name: {{ grains.homedir }}/.config/i3/config
        - marker_start: "# 4kFilterDPI"
        - marker_end: "# /4kFilterDPI"
        - content: "exec --no-startup-id xrandr --dpi 220"
        - show_changes: True
