command_not_found_handle() {
  # don't run if not in a container
  if [ ! -e /run/.containerenv ] && [ ! -e /.dockerenv ]; then
    echo "${@}" Not Found!
    exit 127
  fi

  distrobox-host-exec "${@}"
}

if [[ "${CONTAINER_ID}" ]]; then
  if [ -n "${ZSH_VERSION-}" ]; then
    command_not_found_handler() {
      command_not_found_handle "$@"
    }
  fi

  # echo "In container, preparing devbox and Nix"
  if [[ ! -e /usr/local/bin/devbox ]]; then
    curl -fsSL https://get.jetify.com/devbox | bash
  fi
  if [[ -e /var/home/auyer/.nix-profile/etc/profile.d/nix.sh ]]; then
    source /var/home/auyer/.nix-profile/etc/profile.d/nix.sh
  fi

  eval "$(devbox global shellenv --init-hook)"

  if ! [ -x "$(command -v rg)" ]; then
    devbox global add ripgrep awscliv2
  fi

  if ! [ -x "$(command -v starship)" ]; then
    devbox global add starship
  fi

  refresh-global
fi
