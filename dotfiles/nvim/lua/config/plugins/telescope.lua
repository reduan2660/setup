return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
    },
    config = function()
      -- key bindings
      vim.keymap.set("n", '<C-p>', require('telescope.builtin').find_files)
      vim.keymap.set("n", '<C-.>', function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config')
        }
      end)
      vim.keymap.set("n", '<C-f>', require('telescope.builtin').live_grep)
      vim.keymap.set("n", '<C-t>', require('telescope.builtin').lsp_document_symbols)
      vim.keymap.set("n", '<C-H>', require('telescope.builtin').help_tags)
    end,
  },
}
