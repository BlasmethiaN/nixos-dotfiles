{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # lua
    lua-language-server
    stylua
    
    # nix
    nil
    nixpkgs-fmt
  ];
}
