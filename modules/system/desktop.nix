{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.firefox.enable = true;

  qt.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.iosevka
    nerd-fonts.blex-mono
  ];
}
