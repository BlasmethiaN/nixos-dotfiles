{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/system/common.nix
    ../../modules/system/desktop.nix
    ../../modules/system/users.nix
    ../../modules/system/nvidia.nix
  ];

  networking.hostName = "pc";

  fileSystems."/B" = {
    device = "/dev/disk/by-uuid/8137a400-fb83-4f94-8834-70473974bb49";
    fsType = "ext4";
  };

  security.pam.loginLimits = [
    { domain = "*"; type = "soft"; item = "nofile"; value = "65535"; }
    { domain = "*"; type = "hard"; item = "nofile"; value = "65535"; }
  ];

  programs.steam.enable = true;
  system.stateVersion = "25.05";
}
