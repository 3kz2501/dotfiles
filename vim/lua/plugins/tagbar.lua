return {
  {'majutsushi/tagbar',
    config = function()
      vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
      -- GoのためのTagbar設定
      vim.g.tagbar_type_go = {
        ctagstype = 'go',
        kinds = {
          'p:package',
          'f:function',
          'v:variables',
          't:type',
          'c:const',
        }
      }
      -- TypescriptのためのTagbar設定
      vim.g.tagbar_type_typescript = {
        ctagstype = 'typescript',
        kinds = {
          'c:classes',
          'n:modules',
          'f:functions',
          'v:variables',
          'v:varlambdas',
          'm:members',
          'i:interfaces',
          'e:enums',
        }
      }

    end
  }
}
