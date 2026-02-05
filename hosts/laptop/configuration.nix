{ pkgs, inputs, outputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/system/common.nix
    ../../modules/system/desktop.nix
    ../../modules/system/users.nix
  ];

  networking.hostName = "laptop";

  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  
  system.stateVersion = "25.05"; 
}