source ~/.my-git-prompt

export PATH="$PATH:/Users/hogefuga/workspace/github.com/flutter/flutter/bin"

# brew pathの設定 start
# https://zenn.dev/ress/articles/069baf1c305523dfca3d
typeset -U path PATH
path=(
    /opt/homebrew/bin(N-/)
    /usr/local/bin(N-/)
    $path
)

if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
        [[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
        alias x64='exec arch -x86_64 /bin/zsh'
        alias a64='exec arch -arm64e /bin/zsh'
        switch-arch() {
                if  [[ "$(uname -m)" == arm64 ]]; then
                        arch=x86_64
                elif [[ "$(uname -m)" == x86_64 ]]; then
                        arch=arm64e
                fi
                exec arch -arch $arch /bin/zsh
        }
fi

setopt magic_equal_subst
# brew pathの設定 end

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export PATH="$PATH:`yarn global bin`"
export GOOGLE_APPLICATION_CREDENTIALS="hogefuga"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hogefuga/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hogefuga/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hogefuga/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hogefuga/google-cloud-sdk/completion.zsh.inc'; fi

#export EDITOR=hogefuga
eval "$(direnv hook zsh)"
