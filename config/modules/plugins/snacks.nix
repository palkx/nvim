{ lib, ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      notifier.enabled = true;
      quickfile.enabled = true;
      statuscolumn.enabled = true;
      words.enabled = true;
      lazygit.enabled = true;
      picker.enabled = true;
      indent.enabled = true;
      scope.enabled = true;
    };
  };

  keymaps = [
    {
      key = "<leader><space>";
      action = lib.nixvim.mkRaw "function() Snacks.picker.smart() end";
      options = {
        desc = "Smart Find Files";
      };
    }
    {
      key = "<leader>,";
      action = lib.nixvim.mkRaw "function() Snacks.picker.buffers() end";
      options = {
        desc = "Buffers";
      };
    }
    {
      key = "<leader>/";
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep() end";
      options = {
        desc = "Grep";
      };
    }
    {
      key = "<leader>:";
      action = lib.nixvim.mkRaw "function() Snacks.picker.command_history() end";
      options = {
        desc = "Command History";
      };
    }
    {
      key = "<leader>n";
      action = lib.nixvim.mkRaw "function() Snacks.picker.notifications() end";
      options = {
        desc = "Notification History";
      };
    }
    {
      key = "<leader>e";
      action = lib.nixvim.mkRaw "function() Snacks.explorer() end";
      options = {
        desc = "File Explorer";
      };
    }
    {
      key = "<leader>fb";
      action = lib.nixvim.mkRaw "function() Snacks.picker.buffers() end";
      options = {
        desc = "Buffers";
      };
    }
    {
      key = "<leader>fc";
      action = lib.nixvim.mkRaw "function() Snacks.picker.files({ cwd = vim.fn.stdpath(\"config\") }) end";
      options = {
        desc = "Find Config File";
      };
    }
    {
      key = "<leader>ff";
      action = lib.nixvim.mkRaw "function() Snacks.picker.files() end";
      options = {
        desc = "Find Files";
      };
    }
    {
      key = "<leader>fg";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_files() end";
      options = {
        desc = "Find Git Files";
      };
    }
    {
      key = "<leader>fp";
      action = lib.nixvim.mkRaw "function() Snacks.picker.projects() end";
      options = {
        desc = "Projects";
      };
    }
    {
      key = "<leader>fr";
      action = lib.nixvim.mkRaw "function() Snacks.picker.recent() end";
      options = {
        desc = "Recent";
      };
    }
    {
      key = "<leader>gb";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_branches() end";
      options = {
        desc = "Git Branches";
      };
    }
    {
      key = "<leader>gl";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_log() end";
      options = {
        desc = "Git Log";
      };
    }
    {
      key = "<leader>gL";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_log_line() end";
      options = {
        desc = "Git Log Line";
      };
    }
    {
      key = "<leader>gs";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_status() end";
      options = {
        desc = "Git Status";
      };
    }
    {
      key = "<leader>gS";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_stash() end";
      options = {
        desc = "Git Stash";
      };
    }
    {
      key = "<leader>gd";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_diff() end";
      options = {
        desc = "Git Diff (Hunks)";
      };
    }
    {
      key = "<leader>gf";
      action = lib.nixvim.mkRaw "function() Snacks.picker.git_log_file() end";
      options = {
        desc = "Git Log File";
      };
    }
    {
      key = "<leader>sb";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lines() end";
      options = {
        desc = "Buffer Lines";
      };
    }
    {
      key = "<leader>sB";
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep_buffers() end";
      options = {
        desc = "Grep Open Buffers";
      };
    }
    {
      key = "<leader>sg";
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep() end";
      options = {
        desc = "Grep";
      };
    }
    {
      key = "<leader>sw";
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep_word() end";
      options = {
        desc = "Visual selection or word";
      };
      mode = "n";
    }
    {
      key = "<leader>s\"";
      action = lib.nixvim.mkRaw "function() Snacks.picker.registers() end";
      options = {
        desc = "Registers";
      };
    }
    {
      key = "<leader>s/";
      action = lib.nixvim.mkRaw "function() Snacks.picker.search_history() end";
      options = {
        desc = "Search History";
      };
    }
    {
      key = "<leader>sa";
      action = lib.nixvim.mkRaw "function() Snacks.picker.autocmds() end";
      options = {
        desc = "Autocmds";
      };
    }
    {
      key = "<leader>sb";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lines() end";
      options = {
        desc = "Buffer Lines";
      };
    }
    {
      key = "<leader>sc";
      action = lib.nixvim.mkRaw "function() Snacks.picker.command_history() end";
      options = {
        desc = "Command History";
      };
    }
    {
      key = "<leader>sC";
      action = lib.nixvim.mkRaw "function() Snacks.picker.commands() end";
      options = {
        desc = "Commands";
      };
    }
    {
      key = "<leader>sd";
      action = lib.nixvim.mkRaw "function() Snacks.picker.diagnostics() end";
      options = {
        desc = "Diagnostics";
      };
    }
    {
      key = "<leader>sD";
      action = lib.nixvim.mkRaw "function() Snacks.picker.diagnostics_buffer() end";
      options = {
        desc = "Buffer Diagnostics";
      };
    }
    {
      key = "<leader>sh";
      action = lib.nixvim.mkRaw "function() Snacks.picker.help() end";
      options = {
        desc = "Help Pages";
      };
    }
    {
      key = "<leader>sH";
      action = lib.nixvim.mkRaw "function() Snacks.picker.highlights() end";
      options = {
        desc = "Highlights";
      };
    }
    {
      key = "<leader>si";
      action = lib.nixvim.mkRaw "function() Snacks.picker.icons() end";
      options = {
        desc = "Icons";
      };
    }
    {
      key = "<leader>sj";
      action = lib.nixvim.mkRaw "function() Snacks.picker.jumps() end";
      options = {
        desc = "Jumps";
      };
    }
    {
      key = "<leader>sk";
      action = lib.nixvim.mkRaw "function() Snacks.picker.keymaps() end";
      options = {
        desc = "Keymaps";
      };
    }
    {
      key = "<leader>sl";
      action = lib.nixvim.mkRaw "function() Snacks.picker.loclist() end";
      options = {
        desc = "Location List";
      };
    }
    {
      key = "<leader>sm";
      action = lib.nixvim.mkRaw "function() Snacks.picker.marks() end";
      options = {
        desc = "Marks";
      };
    }
    {
      key = "<leader>sM";
      action = lib.nixvim.mkRaw "function() Snacks.picker.man() end";
      options = {
        desc = "Man Pages";
      };
    }
    {
      key = "<leader>sp";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lazy() end";
      options = {
        desc = "Search for Plugin Spec";
      };
    }
    {
      key = "<leader>sq";
      action = lib.nixvim.mkRaw "function() Snacks.picker.qflist() end";
      options = {
        desc = "Quickfix List";
      };
    }
    {
      key = "<leader>sR";
      action = lib.nixvim.mkRaw "function() Snacks.picker.resume() end";
      options = {
        desc = "Resume";
      };
    }
    {
      key = "<leader>su";
      action = lib.nixvim.mkRaw "function() Snacks.picker.undo() end";
      options = {
        desc = "Undo History";
      };
    }
    {
      key = "<leader>uC";
      action = lib.nixvim.mkRaw "function() Snacks.picker.colorschemes() end";
      options = {
        desc = "Colorschemes";
      };
    }
    {
      key = "gd";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_definitions() end";
      options = {
        desc = "Goto Definition";
      };
    }
    {
      key = "gD";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_declarations() end";
      options = {
        desc = "Goto Declaration";
      };
    }
    {
      key = "gr";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_references() end";
      options = {
        desc = "References";
      };
    }
    {
      key = "gI";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_implementations() end";
      options = {
        desc = "Goto Implementation";
      };
    }
    {
      key = "gy";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_type_definitions() end";
      options = {
        desc = "Goto T[y]pe Definition";
      };
    }
    {
      key = "gai";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_incoming_calls() end";
      options = {
        desc = "C[a]lls Incoming";
      };
    }
    {
      key = "gao";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_outgoing_calls() end";
      options = {
        desc = "C[a]lls Outgoing";
      };
    }
    {
      key = "<leader>ss";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_symbols() end";
      options = {
        desc = "LSP Symbols";
      };
    }
    {
      key = "<leader>sS";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_workspace_symbols() end";
      options = {
        desc = "LSP Workspace Symbols";
      };
    }
    {
      key = "<leader>z";
      action = lib.nixvim.mkRaw "function() Snacks.zen() end";
      options = {
        desc = "Toggle Zen Mode";
      };
    }
    {
      key = "<leader>Z";
      action = lib.nixvim.mkRaw "function() Snacks.zen.zoom() end";
      options = {
        desc = "Toggle Zoom";
      };
    }
    {
      key = "<leader>.";
      action = lib.nixvim.mkRaw "function() Snacks.scratch() end";
      options = {
        desc = "Toggle Scratch Buffer";
      };
    }
    {
      key = "<leader>S";
      action = lib.nixvim.mkRaw "function() Snacks.scratch.select() end";
      options = {
        desc = "Select Scratch Buffer";
      };
    }
    {
      key = "<leader>n";
      action = lib.nixvim.mkRaw "function() Snacks.notifier.show_history() end";
      options = {
        desc = "Notification History";
      };
    }
    {
      key = "<leader>bd";
      action = lib.nixvim.mkRaw "function() Snacks.bufdelete() end";
      options = {
        desc = "Delete Buffer";
      };
    }
    {
      key = "<leader>cR";
      action = lib.nixvim.mkRaw "function() Snacks.rename.rename_file() end";
      options = {
        desc = "Rename File";
      };
    }
    {
      key = "<leader>gB";
      action = lib.nixvim.mkRaw "function() Snacks.gitbrowse() end";
      options = {
        desc = "Git Browse";
      };
      mode = "n";
    }
    {
      key = "<leader>gg";
      action = lib.nixvim.mkRaw "function() Snacks.lazygit() end";
      options = {
        desc = "Lazygit";
      };
    }
    {
      key = "<leader>un";
      action = lib.nixvim.mkRaw "function() Snacks.notifier.hide() end";
      options = {
        desc = "Dismiss All Notifications";
      };
    }
    {
      key = "<c-/>";
      action = lib.nixvim.mkRaw "function() Snacks.terminal() end";
      options = {
        desc = "Toggle Terminal";
      };
    }
    {
      key = "<c-_>";
      action = lib.nixvim.mkRaw "function() Snacks.terminal() end";
      options = {
        desc = "which_key_ignore";
      };
    }
    {
      key = "]]";
      action = lib.nixvim.mkRaw "function() Snacks.words.jump(vim.v.count1) end";
      options = {
        desc = "Next Reference";
      };
      mode = "n";
    }
    {
      key = "[[";
      action = lib.nixvim.mkRaw "function() Snacks.words.jump(-vim.v.count1) end";
      options = {
        desc = "Prev Reference";
      };
      mode = "n";
    }
  ];
}
