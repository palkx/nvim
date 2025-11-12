{ lib, ... }:
{
  imports = [
    # Default configurations for lsp servers
    ./lspconfig.nix

    ./ansiblels.nix
    ./bashls.nix
    ./docker_compose_language_server.nix
    ./dockerls.nix
    ./gopls.nix
    ./helm_ls.nix
    ./jdtls.nix
    ./jsonls.nix
    ./jsonnet_ls.nix
    ./just.nix
    ./lua_ls.nix
    ./marksman.nix
    ./nixd.nix
    ./pyright.nix
    ./tflint.nix
    ./yamlls.nix
  ];
}
