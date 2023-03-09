---@type LazySpec
local M = {
  'hrsh7th/nvim-cmp',
  lazy = false,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'petertriho/cmp-git',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- 'lukas-reineke/cmp-rg',
    'andersevenrud/cmp-tmux',
    'David-Kunz/cmp-npm',
    'rcarriga/cmp-dap',
    'jcdickinson/codeium.nvim',
  },
}

M.config = function()
  local cmp = require('cmp')
  local types = require('cmp.types')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match('%s')
        == nil
  end

  vim.o.pumheight = 10

  cmp.setup({
    experimental = {
      ghost_text = true,
    },
    enabled = function()
      return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
          or require('cmp_dap').is_dap_buffer()
    end,
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
          ['<C-n>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
          ['<C-p>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
          ['<PageDown>'] = cmp.mapping.scroll_docs(-4),
          ['<PageUp>'] = cmp.mapping.scroll_docs(4),
      ---@diagnostic disable-next-line: missing-parameter
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-a>'] = cmp.mapping.abort(),
          ['<C-e>'] = cmp.mapping.confirm({
        behavior = types.cmp.ConfirmBehavior.Replace,
        select = true,
      }),
          ['<CR>'] = cmp.mapping.confirm({
        behavior = types.cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    }),
    sources = cmp.config.sources({
      -- { name = 'copilot' },
      { name = 'codeium' },
      -- { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'neorg' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'tmux' },
      -- { name = 'rg' },
      { name = 'npm',     keyword_length = 4 },
    }, { { name = 'buffer' } }),
    formatting = {
      format = function(entry, vim_item)
        -- if entry.source.name == 'copilot' then
        --   vim_item.kind = ''
        --   vim_item.kind_hl_group = 'Title'
        --   return vim_item
        -- end
        if entry.source.name == 'codeium' then
          vim_item.kind = 'ﬥ'
          vim_item.kind_hl_group = 'Title'
          return vim_item
        end
        return lspkind.cmp_format({ with_text = false, maxwidth = 50 })(
          entry,
          vim_item
        )
      end,
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        -- require('copilot_cmp.comparators').prioritize,
        -- require('copilot_cmp.comparators').score,

        -- Below is the default comparitor list and order for nvim-cmp
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, { { name = 'buffer' } }),
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      { { name = 'path' } },
      { { name = 'cmdline' } }
    ),
  })

  cmp.setup.filetype(
    { 'dap-repl', 'dapui_watches' },
    { sources = { { name = 'dap' } } }
  )

  cmp.event:on('confirm_done', vim.lsp.buf.semantic_tokens_full)
end

return M
