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
    ./ruff.nix
    ./tflint.nix
    ./yamlls.nix
  ];

  # lsp.keymaps = [
  #   {
  #     key = "gd";
  #     lspBufAction = "definition";
  #   }
  #   {
  #     key = "gD";
  #     lspBufAction = "references";
  #   }
  #   {
  #     key = "gt";
  #     lspBufAction = "type_definition";
  #   }
  #   {
  #     key = "gi";
  #     lspBufAction = "implementation";
  #   }
  #   {
  #     key = "K";
  #     lspBufAction = "hover";
  #   }
  #   {
  #     action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
  #     key = "<leader>k";
  #   }
  #   {
  #     action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
  #     key = "<leader>j";
  #   }
  #   {
  #     action = "<CMD>LspStop<Enter>";
  #     key = "<leader>lx";
  #   }
  #   {
  #     action = "<CMD>LspStart<Enter>";
  #     key = "<leader>ls";
  #   }
  #   {
  #     action = "<CMD>LspRestart<Enter>";
  #     key = "<leader>lr";
  #   }
  #   # {
  #   #   action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
  #   #   key = "gd";
  #   # }
  #   {
  #     action = "<CMD>Lspsaga hover_doc<Enter>";
  #     key = "K";
  #   }
  # ];
}
