#!/bin/bash

# サウンド関連の初期設定
sudo sed -e '$ a blacklist snd_hdmi_lpe_audio' /etc/modprobe.d/blacklist.conf

# ucmファイルのコピー
sudo cp -rf ./ucm/cht-bsw-rt5672 /usr/share/alsa/ucm

# Suspend 設定
sudo gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
sudo cp -f ./scripts/root-resume.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable root-resume.service
