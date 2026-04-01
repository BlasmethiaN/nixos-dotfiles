{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    stylua

    nodePackages.bash-language-server # bashls
    nodePackages.vscode-langservers-extracted # html, cssls, jsonls
    nodePackages.typescript-language-server # ts_ls
    nodePackages.vim-language-server # vimls
    nodePackages.yaml-language-server # yamlls

    pyright # pyright
    rust-analyzer # rust_analyzer
    terraform-ls # terraformls
    marksman # marksman
    nil
    nixpkgs-fmt

    clang-tools

    nodePackages.yaml-language-server
    taplo

    haskell-language-server
  ];
}
