# Kingjim portabook xmc10 専用パッチなど

## Ubuntu 24.04

インストーラーを普通に起動すると白い画面になります。下記の２点の操作が必要です。
- インストール時に、Ubuntu(safe graphics)を選択してインストール

- インストールしたあとに一度、インストーラーのUSBメモリで起動して、/boot/grub/grub.cfgを編集して、起動オプションに```nomodeset```を追加する必要があります。

Bluetoothやサウンドは動きますが、WiFiは動かないので、なんとかしましょう。(私はTP-LinkのArcherT1Uをさしました)

### キーボードドライバのインストール

ネットワークに接続している必要があります。

キーボードのドライバをdkmsでインストールできるようにしました。￥や＿等のボタンが効くようになります。
Ubuntu 24.04で動作確認しました。(カーネルは6.8.0-49-generic)

[kingjim-xmc10-x86-64.dkms.tar.gz](dkms/kingjim-xmc10-x86-64.dkms.tar.gz)をダウンロードして、下記のコマンドを実行してください。

例では、ホームディレクトリ上に置いた状態です。

```bash
sudo dkms ldtarball ~/kingjim-xmc10-x86-64.dkms.tar.gz
sudo dkms install -m kingjim-xmc10/1.0
sudo modprobe kingjim-xmc10
```


## patch

Linuxカーネル用のパッチ

Ubuntu18.04LTSがリリースされたので今後は4.15をメインで追っていこうと思います。

- Bluetoothアダプタの認識
	- Realtek RTL8723BS("OBDA8723")を認識させるように変更。
Kernel4.15以降ではdrivers/acpi/scan.cの仕様変更に対応しています。
- Suspendすると固まる現象に対応
- 日本語キーボードで使えないキーがある問題に対処
- サウンドが鳴らない問題に対処
	- Kernel4.17以降はデフォルトで対応されているのでパッチしていません。
### portabook_kernel_4.15.patch(★推奨パッチ)
  Ubuntu18.04のlinux-sourceをベースにしています。(4.15.18)
  バッテリー表示も少し安定するようです。
  portabookのbluetooth(Realtek rtl8723bs)を動かすためにacpiのスキャン方法を変更しています。

### portabook_kernel_4.19.patch
  Bluetoothのパッチが必要なくなりました。
  サスペンド復帰時に固まります。バッテリー表示も怪しいです。

## scripts
### root-resume.service
  サスペンド後に復帰すると固まる現象を回避するためのサービス。

## ucm
Kernel4.15以降に対応したalsa UCMファイル。
  ドライバ名がcherrytrailcraudioからcht-bsw-rt5672に変わったので変更が必要。
  /usr/share/alsa/ucm/配下にコピーしてください。
sudo cp -rf ucm/cht-bsw-rt5672 /usr/share/alsa/ucm

# 更新履歴
## 2018/12/19 
EOLになったバージョンのパッチを削除
4.15のベースラインをlinux-sourceパッケージのソースへ変更
