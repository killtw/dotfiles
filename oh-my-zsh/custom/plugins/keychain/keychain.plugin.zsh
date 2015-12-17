if command -v keychain &>/dev/null; then
  eval `keychain --eval --agents ssh id_rsa`
fi
