{ inputs, outputs, ... }:

{
  users.users.blasmesian = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users.blasmesian = import ../../home/blasmesian.nix;
  };
}