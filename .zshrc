alias ls="ls -G"

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -e               # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
export HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
export HISTSIZE=10000            # メモリに保存されるヒストリの件数
export SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt EXTENDED_HISTORY   # 開始と終了を記録
setopt hist_save_no_dups   # 古いコマンドと同じものは無視

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### branchの表示設定 ###
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

### Title (user@hostname) ###
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    #echo -ne "\033]0;${USER}@${HOST%%.*}\007"
}
RPROMPT="%1(v|%F{yellow}%1v%f|) $tmp_rprompt"

# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
alias vim="/usr/local/bin/vim"

### aliases for java
alias java_home='/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home'

### aliases for git

alias gst="git status"
alias gco="git checkout"
alias gbr="git branch"
alias gbrm="git branch --merged"
alias gdff="git diff"
alias gfprune="git fetch --prune"
alias gcdf="git diff --cached"
alias gcln="git clean -f"

### functions for git

function git-set-upstream-branch() {
current_branch=`git symbolic-ref --short HEAD`
git branch --set-upstream-to=origin/$current_branch $current_branch
}

function git-push-origin-current-branch() {
current_branch=`git symbolic-ref --short HEAD`
if [ $current_branch = "master" ]; then
  echo "master BRANCH should not be pushed by this command !"
else
  git push -u origin $current_branch
fi
}

function git-push-origin-current-branch--forced() {
current_branch=`git symbolic-ref --short HEAD`
if [ $current_branch = "master" ]; then
  echo "master BRANCH should not be pushed by this command !"
else
  echo 'Are you sure to force push? y/[N]'
  read -k 1 reply
  if [ $reply = 'y' ]; then
    git push origin $current_branch -f
  else
    echo 'Canceled'
  fi
fi
}

function git-delete-origin-current-branch() {
current_branch=`git symbolic-ref --short HEAD`
if [ $current_branch = "master" ]; then
  echo "master BRANCH should not be delete by this command !"
else
  echo 'Are you sure to delete this branch? y/[N]'
  read -k 1 reply
  if [ $reply = 'y' ]; then
    git push origin :$current_branch
  else
    echo 'Canceled'
  fi
fi
}

function git-mv-all-git-managed-files() {
if [ $# != 2 ]; then
  echo 'arguments must be 2';
else
  for file in $(git ls-files | grep $1 | sed -e "s/\($1[^/]*\).*/\1/" | uniq); git mv $file $(echo $file | sed -e "s/$1/$2/")
fi
}

function git-gsed-all-git-managed-files() {
if [ $# != 2 ]; then
  echo 'arguments must be 2';
else
 git grep -l $1 | xargs gsed -i "s/$1/$2/g"
fi
}

### aliases for g++
alias gpp="g++"

# cdコマンド実行後、lsを実行する
function cd() {
builtin cd $@ && ls;
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### PATH for nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

export NODE_PATH=$(npm root -g)
#alias npm='/usr/local/bin/npm'

# Add environment variable for GO
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/git/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
