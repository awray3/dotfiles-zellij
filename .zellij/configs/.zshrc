# zellij shortcuts 
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

function zls () {
 ZJ_SESSIONS=$(zellij list-sessions)
 NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

 if [ "${NO_SESSIONS}" -ge 2 ]; then
     zellij attach \
     "$(echo "${ZJ_SESSIONS}" | sk)"
 elif [ "${NO_SESSIONS}" -eq 1 ]; then
   # already in zellij, so just ls.
   echo "${ZJ_SESSIONS}"
 else
   echo "No zellij sessions."
 fi
}

function zk () {
  ZJ_SESSIONS=$(zellij list-sessions)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
      zellij kill-session \
      "$(echo "${ZJ_SESSIONS}" | sk)"
  elif [ "${NO_SESSIONS}" -eq 1 ]; then
    # already in zellij, so just ls.
    zellij kill-session "${ZJ_SESSIONS}"
  else
    echo "No zellij sessions to kill."
  fi
}

# Opens zellij config.
# all extra args are passed to zellij attach.
function zlc () {
  # if there is no config session already open, make it.
  CONFIG_SESSION_NAME="🛠  Configs"
  CONFIG_LAYOUT="$ZELLIJ_CONFIG_DIR/layouts/configs.kdl"

  zellij --layout $CONFIG_LAYOUT \
     attach $CONFIG_SESSION_NAME "$@"
}

# shortcut of zellij
function zel () {
  # input: name of the session
  zellij --layout .zellij/layout.kdl attach --create $1
}






# Uncomment if you want zellij on startup
# eval "$(zellij setup --generate-auto-start zsh)"
