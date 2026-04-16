{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent = {
          enable = true;
        };
        highlight = {
          enable = true;
        };
      };

      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    # Show sticky context window at top
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 5;
        mode = "topline";
        trim_scope = "outer";
      };
    };

    # highlight scoped function
    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "packer"
            "TelescopePrompt"
            "TelescopeResults"
          ];
        };
        indent = {
          char = "│";
        };
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = true;
        };
      };
    };

    treesitter-textobjects = {
      enable = false;
      settings = {
        select = {
          enable = true;
          lookahead = true;
        };
      };
    };
  };
}
