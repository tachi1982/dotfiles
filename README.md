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

