# Xcodeとcommand line tools
- [ ] Xcode のダウンロード
- [ ] command line toolsのインストール

```shell
xcode-select --install
```
# ssh
- [ ] keygen
- [ ] register key to Github

```shell
ssh-keygen
```


# zsh
- [ ] change default

```
chsh -s /bin/zsh
```

- [ ] edit .zshenv for the devise

# git
- [ ] gitの初期設定

```
git config --global user.name "xxxxx"
git config --global user.email "xxxx@xxxx.com"
```

# homebrew
- [ ] homebrewのinstall

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

# dotfiles
- [ ] git clone and make

```shell
mkdir ~/git
cd ~/git
git clone git@github.dena.jp:tacnoma/dotfiles.git
cd dotfiles
make
```

# vim
- [ ] 7.4 install

```
brew install vim --devel --with-lua
```

- [ ] install neobundle

```
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim
```

- [ ] install plugins by neobundle

```
:NeoBundleInstall
``` 

# mysql

- [ ] install

```
brew intall mysql
mysql.server start
```

# Karabiner

- [ ] Karabinerのsetup

# git clone

- [ ] Gitリポジトリ各種クローン
- [ ] kirinzan
- [ ] aoitsuru
- [ ] deskwar

# ruby
- [ ] rbenv

```shell
$ git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
$ mkdir -p ~/.rbenv/plugins
$ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build 
# Export path
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
$ echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```

- [ ] ruby

```shell
$ rbenv install 2.0.0-pXXX
$ rbenv rehash
$ rbenv global 2.0.0-pXXX
```


- [ ] gem, bundle 

```
rbenv exec gem install bundler
```

