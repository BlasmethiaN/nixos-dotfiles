{ pkgs, ... }: {
  xdg.configFile = {
    "alacritty/alacritty.toml".source = ../../dotfiles/alacritty/alacritty.toml;
    "kitty".source = ../../dotfiles/kitty;
    "hypr".source = ../../dotfiles/hypr;
    "starship.toml".source = ../../dotfiles/starship.toml;
    "eww".source = ../../dotfiles/eww;
    "fastfetch".source = ../../dotfiles/fastfetch;
  };

  home.file = {
    ".local/bin/keyboard_layout.sh" = { source = ../../dotfiles/scripts/keyboard_layout.sh; executable = true; };
    ".local/bin/launch-wofi" = { source = ../../dotfiles/scripts/launch-wofi; executable = true; };
    ".local/bin/launch-wofi-emoji" = { source = ../../dotfiles/scripts/launch-wofi-emoji; executable = true; };
    ".local/bin/screenshot" = { source = ../../dotfiles/scripts/screenshot.sh; executable = true; };
  };

  programs.kitty.enable = true;
  programs.mpv = {
    enable = true;
    config = {
      loop-file = "inf";
      hwdec = "auto-safe";
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}