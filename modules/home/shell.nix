{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#pc";
      nrf = "cd ~/nixos-dotfiles && nix flake update";
      vim = "nvim";
      ls = "eza -la --header --git --icons --group-directories-first";
      rundl = "WEBKIT_DISABLE_COMPOSITING_MODE=1 GDK_BACKEND=x11 deadlock-mod-manager";
    };
    initExtra = ''
      export PATH=$HOME/.local/bin:$PATH
      if command -v fastfetch &>/dev/null; then
          fastfetch --config ~/.config/fastfetch/main.jsonc
      fi
      rm -f $HOME/.local/share/recently-used.xbel
    '';
  };

  programs.starship.enable = true;

  programs.ranger = {
    enable = true;
    extraConfig = ''
      set editor nvim
      set preview_images true
      set preview_images_method ueberzug
      map <C-d> shell dragon-drop -a -x %p --and-exit
    '';
  };
}
