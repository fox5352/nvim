return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'check',
              },
              procMacro = {
                enable = false,
              },
              cargo = {
                buildScripts = {
                  enable = false,
                },
              },
              inlayHints = {
                enable = true,
                parameterHints = true,
                typeHints = true,
                chainingHints = true,
                maxLength = 25,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
      },
    },
  },
}
