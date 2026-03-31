{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../modules/home/shell.nix
    ../modules/home/desktop.nix
  ];

  home = {
    username = "blasmesian";
    homeDirectory = "/home/blasmesian";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_DATA_HOME = "$HOME/.local/share";
    };

    sessionPath = [ "$HOME/.local/bin" ];

    packages = with pkgs; [
      # Python & Dev
      (python3.withPackages (ps: with ps; [ dbus-python pygobject3 ]))
      gnumake gcc nodejs ninja pkg-config stylua lua-language-server
      gobject-introspection

      # Apps
      obsidian vscode gimp zathura libreoffice gedit
      discord spotify brave 

      # Gaming
      heroic lutris wine winetricks gamemode gamescope vulkan-loader rimsort steamcmd deadlock-mod-manager

      # Media & System Tools
      pulsemixer ncdu p7zip unrar playerctl pamixer jq socat mpvpaper
      grim slurp wl-clipboard libnotify eza bat htop btop
      ffmpeg killall curl wget unzip atool feh xclip
      upower fastfetch neofetch wev pulseaudio exfatprogs

      # Desktop UI
      eww waybar hyprpanel swww rofi wofi wlr-randr
      dragon-drop ueberzugpp yazi xsettingsd
      blueman bluez picom

      # Fonts & Icons
      font-awesome liberation_ttf noto-fonts-color-emoji
      noto-fonts-cjk-sans fira-code fira-code-symbols
      proggyfonts jetbrains-mono
    ];
  };

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };
}
