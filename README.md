# Kingjim portabook xmc10 専用パッチなど
## patch
Linux用の各種パッチ
### portabook_kernel_4.14.9.patch
  カーネル4.13.x,4.14.x向けのpatch。4.14.9上で作成しています。
### portabook_kernel_4.15.patch
  カーネル4.15.x向けのpatch。4.15.0上で作成しています。
  portabookのbluetooth(Realtek rtl8723bs)を動かすために一部4.14までの仕様に戻しました。
### portabook_kernel_4.16.patch
  カーネル4.16.x向けのpatch。4.16-rc1上で作成しています。
  修正点は違うものの基本は4.15と同じ。

## ucm
Kernel4.15に対応したalsa UCMファイル。
  ドライバ名がcherrytrailcraudioからcht-bsw-rt5672に変わったので変更が必要。
  /usr/share/alsa/ucm/配下にコピーしてください。
sudo cp -rf ucm/cht-bsw-rt5672 /usr/share/alsa/ucm

