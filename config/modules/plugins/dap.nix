{
  plugins.dap = {
    enable = true;
    luaConfig.post = ''
      local dap = require('dap')

      dap.configurations.python = {
        {
          type = 'python',
          request = 'attach',
          name = 'Attach Remote (prompt for path)',
          connect = {
            host = '127.0.0.1',
            port = 5678,
          },
          pathMappings = function()
            local remoteRoot = vim.fn.input('Remote root path: ', '/app')
            return {
              {
                localRoot = vim.fn.getcwd(),
                remoteRoot = remoteRoot,
              },
            }
          end,
        },
      }
    '';
  };
  plugins.dap-ui.enable = true;
  plugins.dap-python.enable = true;

  keymaps = [ ];
}
