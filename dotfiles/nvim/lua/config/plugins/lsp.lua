return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },

    config = function()
      vim.lsp.config('setup', {
        capabilities = require('blink.cmp').get_lsp_capabilities()
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        root_markers = { '.git', 'init.lua' },
      })

      vim.lsp.enable('lua_ls')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- LSP Keybindings
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      -- go
      vim.lsp.config('gopls', {
        cmd = { 'gopls' },
        root_markers = { 'go.mod' }
      })

      vim.lsp.enable('gopls')

      -- python
      vim.lsp.config('pyright', {
        cmd = { 'pyright-langserver', '--stdio' },
        root_markers = { 'pyproject.toml', 'setup.py', 'pyrightconfig.json', 'requirements.txt', '.git' }
      })

      vim.lsp.enable('pyright')
    end,
  }
}
