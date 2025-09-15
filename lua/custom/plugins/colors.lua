function ColorMeImpressed()
  local colors = { 'tokyonight-night', 'dark_flat', 'cyberdream', 'synthweave-transparent', 'NeoSolarized', 'one_monokai', 'fluoromachine' }

  math.randomseed(os.time())
  local color = colors[math.random(1, #colors)]

  vim.cmd.colorscheme(color)
end

function ColorMeBack()
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
      }
    end,
  },
  { 'sekke276/dark_flat.nvim', lazy = false, priority = 1000 },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'samharju/synthweave.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    'ficcdaf/ashen.nvim',
    -- optional but recommended,
    -- pin to the latest stable release:
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },
  {
    'cpea2506/one_monokai.nvim',
  },
  { -- ----------------------------------------------------------------
    'maxmx03/fluoromachine.nvim',
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = true,
        theme = 'fluoromachine',
      }

      ColorMeImpressed()
      ColorMeBack()

      vim.keymap.set('n', '<Leader>ct', function()
        ColorMeImpressed()
        ColorMeBack()
      end, { desc = 'reloads the colorscheme' })

      vim.keymap.set('n', '<Leader>cmb', function()
        ColorMeBack()
      end, { desc = 'sets the background to transparent' })
    end,
  },
}
