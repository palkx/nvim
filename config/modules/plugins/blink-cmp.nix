{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
            semantic_token_resolution = {
              enabled = false;
            };
          };
        };
      };
      signature = {
        enabled = true;
      };
      sources = {
        default = [
          "omni"
          "lsp"
          "buffer"
          "path"
        ];
      };
    };
  };
}
