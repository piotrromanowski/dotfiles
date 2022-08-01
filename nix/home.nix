{ config, pkgs, lib, nodejs, ... }:

let
  #customNodePackages = pkgs.callPackage ./npm {};
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./efm
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "piotr";
  home.homeDirectory = "/home/piotr";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    #customNodePackages.prettier
    powerline-fonts
    awscli
    bazelisk
    docker
    fd
    fzf
    gcc
    go
    gopls
    htop
    jq
    neovim
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.node2nix
    silver-searcher
    tailscale
    tmux
    tree
    watch
    zsh-autosuggestions
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
  };

  home.file = {
    ".config/alacritty/alacritty.yml".text = ''
      {"font":{"bold":{"style":"Bold"}}}
    '';
  };

  home.file = {
    ".tmux.conf".text = builtins.readFile ../.tmux.conf;
  };

  #home.file = {
  #".config/typescript".source = fetchFromGitHub {
  #   owner = "yrashk";
  #   repo = "calendar";
  #   rev = "1ed19a3";
  #   sha256 = "1xfax18y4ddafzmwqp8qfs6k34nh163bwjxb7llvls5hxr79vr9s";
  #};
  #}

  programs.git = {
    enable = true;
    userName = "Piotr Romanowski";
    userEmail = "piotrromanowski1@gmail.com";
    aliases = {
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
      ca = "commit amend";
      co = "checkout";
      pg = "push origin HEAD:refs/for/develop";
      pgp = "push origin HEAD:refs/for/develop%private";
      pgm = "push origin HEAD:refs/for/master";
    };
    extraConfig = {
      color.ui = true;
      github.user = "piotrromanowski";
      init.defaultBranch = "main";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family JetBrains Mono
      font_size 11.0
      shell zsh
    '';
    # themes. see $ kitty +kitten themes
    # "Afterglow" "AquariumDark" "Ayu Mirage" "citylights" "Dark One Nuanced" "Doom Vibrant"
    theme = "Dracula";
  };

  programs.zsh = {
    enable = true;

    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };

    plugins = with pkgs; [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      theme  = "af-magic";

      plugins = [
          "command-not-found"
          "fzf"
          "git"
          "history"
          "sudo"
          "tmux"
      ];
    };
  };

  xdg.configFile.nvim = {
    source = ../.config/nvim;
    recursive = true;
  };

  xdg.configFile.i3 = {
    source = ../.config/i3;
    recursive = true;
  };
}
