{
  description = "NVIM Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };

      recursiveMerge = attrList: let
        f = attrPath:
          builtins.zipAttrsWith (n: values:
            if pkgs.lib.tail values == []
            then pkgs.lib.head values
            else if pkgs.lib.all pkgs.lib.isList values
            then pkgs.lib.unique (pkgs.lib.concatLists values)
            else if pkgs.lib.all pkgs.lib.isAttrs values
            then f (attrPath ++ [n]) values
            else pkgs.lib.last values);
      in
        f [] attrList;
    in rec {
      dependencies = with pkgs;
        [
          ripgrep
          zsh # terminal requires it
          git
          curl # needed to fetch titles from urls
          zk # lsp for markdown notes
          terraform-ls # terraform lsp
          tflint # terraform linter
          nodePackages.bash-language-server # bash lsp
        ];
      neovim-augmented = recursiveMerge [
        pkgs.neovim-unwrapped
        {buildInputs = dependencies;}
      ];
      packages.pwnvim = pkgs.wrapNeovim neovim-augmented {
        viAlias = true;
        vimAlias = true;
        withNodeJs = false;
        withPython3 = false;
        withRuby = false;
        extraPython3Packages = false;
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}"'';
        # make sure impatient is loaded before everything else to speed things up
        configure = {
          customRC =
            ''
              lua << EOF
                package.path = "${self}/?.lua;" .. package.path
            ''
            + pkgs.lib.readFile ./init.lua
            + ''
              EOF
            '';
          packages.myPlugins = with pkgs.vimPlugins; {
            start = with pkgs.vimPlugins; [
                # Common dependencies of other plugins
                plenary-nvim # dependency of some other plugins
                todo-comments-nvim # highlight TODO comments
                nvim-treesitter # syntax highlight
                undotree # better vim file edit history
                nvim-surround # .... updated lua-based alternative to tpope's surround
                comment-nvim # code commenter
                crates-nvim # inline intelligence for Cargo.toml
                nvim-lspconfig # LSP for intilligent coding
                null-ls-nvim # formatting and linting via lsp system
                lspsaga-nvim
                trouble-nvim # navigate all warnings and errors in quickfix-like window
                fidget-nvim # show lsp status in bottom right but not status line
                neodev-nvim # help for neovim lua api
                lsp-format-nvim
                SchemaStore-nvim # json schemas
                # vim-fugitive # git control

                # UI
                onedarkpro-nvim # colorscheme
                ir_black # colorscheme for basic terminals
                telescope-nvim # da best popup fuzzy finder
                telescope-fzy-native-nvim # with fzy gives better results
                telescope-frecency-nvim # and frecency comes in handy too
                nvim-colorizer-lua # color over CSS like #00ff00
                nvim-web-devicons # makes things pretty; used by many plugins below
                nvim-tree-lua # file navigator
                gitsigns-nvim # git status in gutter
                symbols-outline-nvim # navigate the current file better
                lualine-nvim # nice status bar at bottom
                vim-bbye # fix bdelete buffer stuff needed with bufferline
                bufferline-nvim
                indent-blankline-nvim # visual indent
                toggleterm-nvim # better terminal management
                nvim-treesitter.withAllGrammars # better code coloring
                # playground # treesitter playground
                nvim-treesitter-textobjects # jump around and select based on syntax (class, function, etc.)
                nvim-treesitter-context # keep current block header (func defn or whatever) on first line
                lf-vim
                
                # Autocompletion
                nvim-cmp # generic autocompleter
                cmp-nvim-lsp # use lsp as source for completions
                cmp-nvim-lua # makes vim config editing better with completions
                cmp-buffer # any text in open buffers
                cmp-path # complete paths
                cmp-cmdline # completing in :commands
                cmp-emoji # complete :emojis:
                cmp-nvim-lsp-signature-help # help complete function call by showing args
                cmp-npm # complete node packages in package.json
                nvim-autopairs # balances parens as you type
                nvim-ts-autotag # balance or rename html
                vim-emoji # TODO: redundant now?
                luasnip # snippets driver
                cmp_luasnip # snippets completion
                friendly-snippets # actual library of snippets used by luasnip
                zk-nvim # lsp for a folder of notes for searching/linking/etc
                true-zen-nvim # distraction free, width constrained writing mode

                nui-nvim # UI Component Library for Neovim
                gitsigns-nvim # git file changes
                project-nvim
                vim-tmux-navigator # navigate vim and tmux panes together
                impatient-nvim # speeds startup times by caching lua bytecode
                which-key-nvim # WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing
                diffview-nvim # git diff viewer
            ];
            opt = with pkgs.vimPlugins; [
              # grammar check
              vim-grammarous
            ];
          };
        };
      };
      apps.pwnvim = flake-utils.lib.mkApp {
        drv = packages.pwnvim;
        name = "pwnvim";
        exePath = "/bin/nvim";
      };
      packages.default = packages.pwnvim;
      apps.default = apps.pwnvim;
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [packages.pwnvim] ++ dependencies;
      };
    });
}
