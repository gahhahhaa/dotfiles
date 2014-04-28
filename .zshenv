limit coredumpsize 0
# Setup command search path
typeset -U path
# (N-/)を付けることで存在しなければ無視してくれる
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/))

# リモートから起動するコマンド用の環境変数を設定（必要なら）
export RSYNC_RSH=ssh
export CVS_RSH=ssh

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
