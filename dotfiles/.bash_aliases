export PS1="\[$(tput setaf 6)\]\[$(tput bold)\]\t \[$(tput setaf 4)\]\[$(tput bold)\]\w \\$ \[$(tput sgr0)\]"

export GPG_TTY=$(tty)

export EDITOR="vim"

export PARTICLE_DEVELOP=1

# Set terminal title
export PS1="\[\e]0;\w\a\]$PS1"

# ls
alias la="ls -A"
alias lh="ls -lah"
alias l="ls"
alias ll="ls -la"

# General
alias ..="cd .."
alias p="neopo particle"
alias py="python3"

# git
alias pull="git pull"
alias skip-ci="update '[skip ci]'"

function update()
{
  cd "$(pwd)"
  git add -A
  #git commit -S -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")" # Replace the line below with this one for GPG signed commits
  git commit -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")"
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

