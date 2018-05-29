function vir
{
  gvim --remote $1
}

function jqc {
  local script=${1:-.}
  jq -C $script
}

function lessr {
  less -R
}

function jql {
  local script=${1:-.}
  jqc $script | lessr
}
