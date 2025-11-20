  { config, pkgs, inputs, ... }:

  {
    home.username = "blasmesian";
    home.homeDirectory = "/home/blasmesian";
    home.stateVersion = "24.11";

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      Path = "/home/blasmesian/.local/bin:" + builtins.getEnv "PATH";
      XDG_STATE_HOME = "/home/blasmesian/.local/state";
      XDG_DATA_HOME = "/home/blasmesian/.local/share";
      XCURSOR_THEME = "Bibata-Original-Classic";
      XCURSOR_SIZE = "24";
    };


    programs.bash = {
      enable = true;
      shellAliases = {
	nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#pc";
	vim = "nvim";
      };
      initExtra = ''
  export PATH=$HOME/.local/bin:$PATH
  if command -v fastfetch &>/dev/null; then
      fastfetch --config ~/.config/fastfetch/main.jsonc
  fi
'';
    };

    programs.starship = {
      enable = true;
    };

    programs.kitty.enable = true;

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
      ".config/kitty".source = ../dotfiles/kitty;
      ".config/hypr".source = ../dotfiles/hypr;
      ".config/starship.toml".source = ../dotfiles/starship.toml;
      ".config/waybar".source = ../dotfiles/waybar;
      ".config/hyprpanel".source = ../dotfiles/hyprpanel;
      ".config/fastfetch".source = ../dotfiles/fastfetch;
      ".local/bin/keyboard_layout.sh" = {
	source = ../dotfiles/scripts/keyboard_layout.sh;
        executable = true;
      };
      ".local/bin/launch-wofi" = {
	source = ../dotfiles/scripts/launch-wofi;
        executable = true;
      };
    };

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      nerd-fonts.caskaydia-mono
      nerd-fonts.iosevka
      nerd-fonts.blex-mono
      fira-code
      fira-code-symbols
      font-awesome
      liberation_ttf
      proggyfonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      xsettingsd
      discord
      spotify
      steam
      vulkan-loader
      wlr-randr
      waybar
      hyprpanel
      swww
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
      kitty
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
      bluez
      dbus
      killall
      ninja
      pkg-config
      curl
      lua-language-server
      jetbrains-mono
      jq
      bibata-cursors
      neofetch
      upower
      fastfetch
      gedit
    ];

  }
