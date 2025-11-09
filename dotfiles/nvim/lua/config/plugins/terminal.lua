return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = 'horizontal', -- or 'horizontal', 'vertical', 'tab'
        size = 20,
        float_opts = {
          border = 'curved',
        },
      })
    end,
  }
}
