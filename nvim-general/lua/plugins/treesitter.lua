-- nvim-treesitter main branch = parser manager only (highlight/indent/fold/selection are native nvim 0.12)
-- incremental selection: an/in/]n/[n/]N/[N by default (:h treesitter-defaults; no scope-based object)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- plugin does not support lazy-loading (README)
    build = ":TSUpdate",
    config = function()
      local languages = {
        "python",
        "toml",
        "yaml",
        "json",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "bash",
        "regex",
      }
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local filetype = args.match
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end

          vim.treesitter.start(args.buf, language)
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo[0][0].foldmethod = 'expr'
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
