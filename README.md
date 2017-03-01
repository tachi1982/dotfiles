# my dotfiles

.vimrc
.zshrc

## 環境設定手順:

1. git cloneしてmakeすると上記.ファイルのシンボリックリンクを作成

```
$ git clone https://sample.com/dotfiles.git
$ cd dotfiles
$ make
```

2. 続いて必要なtoolの導入

```
$ make install-env-tools
```

# vim plugin Neobundle のインストール

```
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

vimを起動して
```
:NeoBundleInstall
```
を実行すれば各プラグインがインストールされる

# editorconfigの導入

Homebrew が入っていれば、

```
$ brew install editorconfig でOK
```

# mac の ターミナル の設定

- メニューの【ターミナル】 -> 【環境設定...】でプロファイルを開く
- プロファイル Homebrew を選択し、 下部の 【デフォルト】 を押す
- 【テキスト】タブ
    - 【カーソル】
        - ブロックを選択
        - カーソルの色を水色と緑色の中間ぐらいに
    - 点滅とか色々設定する

