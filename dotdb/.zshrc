# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT=$' %F{10}${PWD/#$HOME/~} %F{12}${vcs_info_msg_0_} %F{yellow}%T%f %{$reset_color%} \n > '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt hist_ignore_all_dups #dont save doplucate commands
setopt hist_ignore_space #dont save spaces in history file
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
export HISTFILE=~/.zsh_history

# vi mode
bindkey -v
export KEYTIMEOUT=1
setopt HIST_IGNORE_SPACE

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export EDITOR="nvim"
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

alias ls='ls --color=auto'
alias awslogin="aws-okta login && aws-okta creds -r arn:aws:iam::182162384657:role/NonProd_MLDataPipelines_DevUsers && source <(aws-okta exec nordstrom-federated -- env | grep AWS - | sed 's/^/export /') && kubectl config get-contexts"
alias venv="source venv/bin/activate"
alias run="bash run.sh"
alias mergec="git diff --check | sed s'/:.*:.*//' | sort -u"
alias bbase="git merge-base --fork-point main"
alias poetryenv="source $(poetry env list --full-path)/bin/activate"

source ~/.zprofile

export DOCKER_HOST=unix:///Users/david_londono/.lima/docker/sock/docker.sock
export KUBECONFIG=~/.kube/clusters/nsk-oxtail-nonprod:~/.kube/clusters/nsk-oxtail-prod:~/.kube/clusters/nsk-gumbo-prod:~/.kube/clusters/nsk-gumbo-nonprod:~/.kube/config
export GOPROXY=https://david.londono:$ARTIFACTORY_API_KEY@artifactory.nordstrom.com/artifactory/api/go/go
export GONOSUMDB="git.jwn.app/*"
export PATH="$HOME/scripts:$HOME/.rustup:$PATH"


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# opam configuration
[[ ! -r /Users/david_londono/.opam/opam-init/init.zsh ]] || source /Users/david_londono/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/david_londono/nord/pelican/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/david_londono/nord/pelican/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/david_londono/nord/pelican/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/david_londono/nord/pelican/google-cloud-sdk/completion.zsh.inc'; fi

fpath+=~/.zfunc; autoload -Uz compinit; compinit
