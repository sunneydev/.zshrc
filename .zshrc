alias c="code"

# Kill Port
function kp() {
	kill -9 $(lsof -t -i:$1)
}

alias reload='source ~/.zshrc'

function work {
    cd ~/Workspace
    echo "~ Work\n"
    ls
}

# Quick Commit
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

# Quick Commit to Vercel
function qcv {
	qc $1
	vercel --prod
}

function myip() {
    echo "Local IP: $(ipconfig getifaddr en0)"
    echo "Remote IP: $(curl -s https://api.ipify.org)"
}

# Reload Launch Agent
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

