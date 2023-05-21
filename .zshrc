eval "$(fnm env --use-on-cd)"

export PNPM_HOME=$HOME/Library/pnpm
export PATH="$PNPM_HOME:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export GOPATH=$HOME/Library/go
export PATH="$PATH:$GOPATH/bin"

alias c="code"
alias server="ssh -i ~/.ssh/main sunney@vps.sunney.dev"


function kp() {
	kill -9 $(lsof -t -i:$1)
}

# bun completions
[ -s "/Users/sunney/.bun/_bun" ] && source "/Users/sunney/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias reload='source ~/.zshrc'

function work {
    cd ~/Workspace
    echo "~ Work\n"
    ls
}

function qc {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

function qcv {
	qc $1
	vercel --prod
}

function myip() {
    echo "Local IP: $(ipconfig getifaddr en0)"
    echo "Remote IP: $(curl -s https://api.ipify.org)"
}

function rla() {

  local agent_name="$1"

  if [[ -z "$agent_name" ]]; then
    echo "Usage: restart_launchagent <agent_name>"
    return 1
  fi

  local plist_path="$HOME/Library/LaunchAgents/$agent_name.plist"

  if [[ ! -f "$plist_path" ]]; then
    echo "Error: LaunchAgent plist not found at $plist_path"
    return 1
  fi

  launchctl unload "$plist_path" && launchctl load "$plist_path"
  echo "Restarted LaunchAgent: $agent_name"
}

