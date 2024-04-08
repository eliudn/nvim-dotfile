return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.

    icons = {
      -- Configure the base icons on the bufferline.
      -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
      -- 
      buffer_index = true,
      buffer_number = false,
      button = '',
      -- Enables / disables diagnostic symbols
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
        [vim.diagnostic.severity.WARN] = { enabled = false },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = true },
      },
    separator = {left = '', right = ''},
    },
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  config = function(_, opts)
    local map = vim.api.nvim_set_keymap
    local desc = { noremap = true, silent = true }

    require("barbar").setup(opts)
    -- Move to previous/next
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', desc)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', desc)
    -- Re-order to previous/next
    map('n', '<A-\'>', '<Cmd>BufferMovePrevious<CR>', desc)
    map('n', '<A-¿>', '<Cmd>BufferMoveNext<CR>', desc)
    -- Goto buffer in position...
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', desc)
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', desc)
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', desc)
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', desc)
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', desc)
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', desc)
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', desc)
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', desc)
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', desc)
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', desc)
    -- Pin/unpin buffer
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', desc)
    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', desc)
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', desc)
    -- Sort automatically by...
    map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc)
    map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', desc)
    map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', desc)
    map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc)

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  end
}
