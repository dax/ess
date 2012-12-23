if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ess ess

_ess() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(ess commands)"
  else
    completions="$(ess completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
