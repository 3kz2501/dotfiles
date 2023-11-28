return{
  'akinsho/bufferline.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  config = function()
    require('bufferline').setup{}
  end,
  key = {
   {'<leader>wl', '<CMD>BufferLineCloseRight<CR>', mode={'n'},},
   {'<leader>wh', '<CMD>BufferLineCloseLeft<CR>', mode={'n'},},
   {'<leader>wall', '<CMD>BufferLineCloseOthers<CR>', mode={'n'},},
   {'<leader>we', '<CMD>BufferLinePickClose<CR>', mode={'n'},},
  },
}
