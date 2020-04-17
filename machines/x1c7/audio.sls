audio/sof:
  pkg.installed:
    - name: sof-firmware

audio/pulse/sink:
  file.line:
    - name: /etc/pulse/default.pa
    - mode: replace
    - match: module-alsa-sink
    - content: load-module module-alsa-sink device=hw:0,0 channels=4

audio/pulse/source:
  file.line:
    - name: /etc/pulse/default.pa
    - mode: replace
    - match: module-alsa-source
    - content: load-module module-alsa-source device=hw:0,6 channels=4
