sudo nixos-rebuild switch --flake .#piotr


## New machine setup
  $ sudo su
  # nix-env -iA nixos.git
  # git clone <repo> /mnt/<path>
  # nixos-install --flake .#piotr
  -- reboot --
  $ sudo rm -r /etc/nixos/configuration.nix
  -- move build to desired location --
