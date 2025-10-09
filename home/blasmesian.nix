  { config, pkgs, ... }:

  {
    home.username = "blasmesian";
    home.homeDirectory = "/home/blasmesian";
    home.stateVersion = "24.11";


    programs.bash = {
      enable = true;
      shellAliases = {
	nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#laptop";
	vim = "nvim";
      };
      initExtra = ''
  export PATH=$HOME/.local/bin:$PATH
'';
    };

    programs.starship = {
      enable = true;
    };

    programs.ranger = {
      enable = true;
      extraConfig = ''
        set editor nvim
	set preview_images true
	set preview_images_method ueberzug

	map <C-d> shell dragon-drag-and-drop -a -x %p --and-exit
      '';
    };


    home.file = with pkgs; {
      ".config/alacritty/alacritty.toml".source = ../dotfiles/alacritty/alacritty.toml;
      ".config/hypr".source = ../dotfiles/hypr;
      ".config/starship.toml".source = ../dotfiles/starship.toml;
      ".config/waybar".source = ../dotfiles/waybar;
      ".local/bin/keyboard_layout.sh" = {
	source = ../dotfiles/scripts/keyboard_layout.sh;
        executable = true;
      };
      ".local/bin/launch-wofi" = {
	source = ../dotfiles/scripts/launch-wofi;
        executable = true;
      };
    };

    home.packages = with pkgs; [
      waybar
      bat
      rofi
      gcc
      ffmpeg
      firefox
      brave
      vim
      neovim
      git
      htop
      btop
      alacritty
      wget
      unzip
      atool
      ranger
      feh
      xclip
      picom
      wofi
      starship
      stylua
      dragon-drop
      nodejs
      python3
      ueberzugpp
      gnutar
      gzip
      yazi
      blueman
      killall
      ninja
      pkg-config
      curl
      lua-language-server
      jetbrains-mono
      jq
    ];
  }
