{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      appearance = {
        nerd_font_variant = "normal";
        use_nvim_cmp_as_default = true;
      };
      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
            semantic_token_resolution = {
              enabled = false;
            };
          };
        };
        trigger = {
          show_on_keyword = true;
          show_on_trigger_character = true;
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
        };
        menu = {
          auto_show = true;
        };
      };
      keymap = {
        preset = "default";
      };
      signature = {
        enabled = true;
      };
      sources = {
        default = [
          "lsp"
          "buffer"
          "snippets"
          "path"
        ];
        providers = {
          buffer = {
            score_offset = -7;
          };
          lsp = {
            fallbacks = [ ];
          };
        };
      };
    };
  };
}
