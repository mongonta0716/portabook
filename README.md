# Kingjim portabook xmc10 専用パッチなど
## patch

Linuxカーネル用のパッチ
カーネルのバージョンアップに合わせて作成していますが、変更点は変わりません。
- Bluetoothアダプタの認識
	- Realtek RTL8723BS("OBDA8723")を認識させるように変更。
Kernel4.15以降ではdrivers/acpi/scan.cの仕様変更に対応しています。
- Suspendすると固まる現象に対応
- 日本語キーボードで使えないキーがある問題に対処
- サウンドが鳴らない問題に対処
	- Kernel4.17以降はデフォルトで対応されているのでパッチしていません。
### portabook_kernel_4.18.patch
  カーネル4.18.x向けのpatch。4.18.5上で作成しています。
  変更点は4.17.xと変わりません。

### portabook_kernel_4.14.9.patch
  カーネル4.13.x,4.14.x向けのpatch。4.14.9上で作成しています。

### portabook_kernel_4.15.patch
  カーネル4.15.x向けのpatch。4.15.0上で作成しています。
  portabookのbluetooth(Realtek rtl8723bs)を動かすためにacpiのスキャン方法を変更しています。

### portabook_kernel_4.16.patch
  カーネル4.16.x向けのpatch。4.16-rc1上で作成しています。
  修正点は違うものの基本は4.15と同じ。

### portabook_kernel_4.17.patch
  カーネル4.17.x向けのpatch。4.17-rc2上で作成しました。
  4.16版とあまり変わりません。サウンドの変更が不要になったようなので削除しています。
  サウンド関連の仕様変更が大きいのでサウンド周りで不具合があるかもしれません。

## scripts
### root-resume.service
  サスペンド後に復帰すると固まる現象を回避するためのサービス。

## ucm
Kernel4.15以降に対応したalsa UCMファイル。
  ドライバ名がcherrytrailcraudioからcht-bsw-rt5672に変わったので変更が必要。
  /usr/share/alsa/ucm/配下にコピーしてください。
sudo cp -rf ucm/cht-bsw-rt5672 /usr/share/alsa/ucm

