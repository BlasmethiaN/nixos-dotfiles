{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.firefox.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.iosevka
    nerd-fonts.blex-mono
  ];
}