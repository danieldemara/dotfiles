# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs="git status"
alias gd="git diff"
alias gb="git branch -vv"
alias gc="git checkout"
alias push="git push"
alias pull="git pull"
alias track="git push --set-upstream origin $(git_current_branch)"
alias cob="git checkout -b"
alias cod="git checkout develop"
alias com="git checkout master"
alias pd="git pull origin develop"
alias pm="git pull origin master"
alias stash="git stash -u"
alias pop="git stash pop"
alias show="git show"
alias wip="git commit -am wip"
alias nah="git reset --hard && git clean -df"
alias ccb="git branch --show-current | tr -d '\n' | pbcopy"

alias k=kubectl
alias kns="kubectl config set-context --current --namespace "
alias kctx="kubectl config use-context "

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"

function find-pod()
{
    kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep $1
}
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

function jwt-decode() {
  jq -R 'split(".") |.[0:2] | map(@base64d) | map(fromjson)' <<< $1
}

