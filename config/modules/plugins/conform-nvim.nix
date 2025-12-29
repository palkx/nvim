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
      autoInstall.enable = true;
      settings = {
        default_format_opts.lsp_format = "fallback";
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
          python = [ "ruff_format" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
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
          go = [
            "goimports"
            "gofmt"
          ];
          # Auto correct misspelled words
          # "*" = [ "codebook" ];
          "_" = [ "trim_whitespace" ];
        };

        formatters = {
          # Disabling because if project has a project limitatiton, then
          # formatter not working at all
          # terraform_fmt = {
          #   command = "${lib.getExe (
          #     pkgs.terraform.overrideAttrs (oldAttrs: {
          #       meta = lib.recursiveUpdate oldAttrs.meta {
          #         license = lib.licenses.gpl3Only;
          #       };
          #     })
          #   )}";
          # };
        };
        format_on_save = # Lua
          ''
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
        format_after_save = # Lua
          ''
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
        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = false;
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
