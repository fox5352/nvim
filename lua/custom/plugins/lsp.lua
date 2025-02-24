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
                command = '',
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
    config = function(_, opts)
      if opts.server == 'ts_ls' then
        require('lspconfig').ts_ls.setup {
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
                languages = { 'javascript', 'typescript', 'jsx', 'tsx' },
              },
            },
          },
          filetypes = {
            'javascript',
            'typescript',
            'typescriptreact',
          },
        }
      else
        require('lspconfig')[opts.server].setup(opts)
      end
    end,
  },
}
