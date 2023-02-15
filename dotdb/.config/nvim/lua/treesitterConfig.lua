require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- exclude php due to error downloading
  ignore_install = { "phpdoc" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
  },

  indent = {
	  enable = true
  },
  textobjects = {
        select = {
          enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
          keymaps = {
            -- You can use the capture groups defined here:
            -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.  scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
            ["is"] = "@scopename.inner",
            ["ic"] = "@call.inner",
            ["aa"] = "@call.inner",
          },
        },
  },
} 
