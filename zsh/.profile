command_not_found_handle() {
# don't run if not in a container
  if [ ! -e /run/.containerenv ] && [ ! -e /.dockerenv ]; then
    echo "${@}" Not Found!
    exit 127
  fi
  
  distrobox-host-exec "${@}"
}
if [ -n "${ZSH_VERSION-}" ]; then
  command_not_found_handler() {
    command_not_found_handle "$@"
 }
fi

# RUSTUP
. "$HOME/.cargo/env"
