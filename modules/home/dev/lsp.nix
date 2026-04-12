{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    stylua
    kdePackages.qtdeclarative

    bash-language-server
    vscode-langservers-extracted
    typescript-language-server
    vim-language-server
    yaml-language-server

    pyright # pyright
    rust-analyzer # rust_analyzer
    terraform-ls # terraformls
    marksman # marksman
    nil
    nixpkgs-fmt
    dart

    clang-tools

    taplo

    haskell-language-server
  ];
}
