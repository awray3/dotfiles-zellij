# zellij shortcuts 
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

#!/usr/bin/env bash
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

eval "$(zellij setup --generate-auto-start zsh)"
