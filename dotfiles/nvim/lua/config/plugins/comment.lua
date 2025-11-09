return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = {
      line = 'gcc',
      block = 'gbc'
    },
  },
  config = function(_, opts)
    require('Comment').setup(opts)

    vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
    vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)>')
    vim.keymap.set('i', '<C-_>', '<Esc><Plug(comment_toggle_linewise_current)i>')
  end,
}
