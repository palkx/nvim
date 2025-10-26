{
  lib,
  pkgs,
  ...
}:
{
  config = {
    extraConfigLuaPre =
      # lua
      ''
        local slow_format_filetypes = {}

        vim.api.nvim_create_user_command("FormatDisable", function(args)
           if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end, {
          desc = "Disable autoformat-on-save",
          bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end, {
          desc = "Re-enable autoformat-on-save",
        })
        vim.api.nvim_create_user_command("FormatToggle", function(args)
          local Snacks = require("Snacks");
          if args.bang then
            -- Toggle formatting for current buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
            Snacks.notify.notify("[Buffer] Autoformat enabled: " .. tostring(not vim.b.disable_autoformat))
          else
            -- Toggle formatting globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            Snacks.notify.notify("[Global] Autoformat enabled: " .. tostring(not vim.g.disable_autoformat))
          end
        end, {
          desc = "Toggle autoformat-on-save",
          bang = true,
        })
      '';

    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
           end
        '';

        format_after_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            return { lsp_fallback = true }
          end
        '';
        notify_on_error = true;
        formatters_by_ft = {
          html = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          css = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          python = [ "ruff" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt-rfc-style" ];
          markdown = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          yaml = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          terraform = [ "terraform_fmt" ];
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          json = [ "jq" ];
          "_" = [ "trim_whitespace" ];
        };

        formatters = {
          ruff = {
            command = "${lib.getExe pkgs.ruff}";
          };
          nixfmt-rfc-style = {
            command = "${lib.getExe pkgs.nixfmt-rfc-style}";
          };
          alejandra = {
            command = "${lib.getExe pkgs.alejandra}";
          };
          jq = {
            command = "${lib.getExe pkgs.jq}";
          };
          prettier = {
            command = "${lib.getExe pkgs.nodePackages.prettier}";
          };
          prettierd = {
            command = "${lib.getExe pkgs.prettierd}";
          };
          stylua = {
            command = "${lib.getExe pkgs.stylua}";
          };
          shellcheck = {
            command = "${lib.getExe pkgs.shellcheck}";
          };
          shfmt = {
            command = "${lib.getExe pkgs.shfmt}";
          };
          shellharden = {
            command = "${lib.getExe pkgs.shellharden}";
          };
          yamlfmt = {
            command = "${lib.getExe pkgs.yamlfmt}";
          };
          terraform_fmt = {
            command = "${lib.getExe (
              pkgs.terraform.overrideAttrs (oldAttrs: {
                meta = lib.recursiveUpdate oldAttrs.meta {
                  license = lib.licenses.gpl3Only;
                };
              })
            )}";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>uf";
        action = "<cmd>FormatToggle<cr>";
        options = {
          desc = "Toggle Format (Global)";
        };
      }
      {
        mode = "n";
        key = "<leader>uF";
        action = "<cmd>FormatToggle!<cr>";
        options = {
          desc = "Toggle Format (Buffer)";
        };
      }
    ];
  };
}
