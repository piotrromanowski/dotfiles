sudo nixos-rebuild switch --flake .#piotr


## New machine setup
  $ sudo su
  # nix-env -iA nixos.git
  # git clone <repo> /mnt/<path>
  # nixos-install --flake .#piotr
  -- reboot --
  $ sudo rm -r /etc/nixos/configuration.nix
  -- move build to desired location --



#### Notes

typescript-language-server is not currently working because it can't find the
typescript lib folder.
  - maybe fetch from github to deterministic folder and use --tsserver-path ?
  https://github.com/typescript-language-server/typescript-language-server/issues/411


prettier "formatCommand" needs to be installed and updated in lspconfig.lua


#### Search for a specific version of a package

https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=bazel

