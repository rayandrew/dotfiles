-- local api = vim.api
-- local map = nvchad.map

local M = {}

M.nvterm = {
  -- mappings = {
  --   toggle = {
  --     float = "<leader>t",
  --     horizontal = "<leader>h",
  --     vertical = "<leader>v",
  --   },
  --   new = {
  --     horizontal = "<leader>nh",
  --     vertical = "<leader>nv",
  --   },
  -- },
}

M.nvimtree = {
  open_on_setup = true,
  git = {
    enable = true,
  },
}

M.telescope = {
  requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },

  config = function()
    require("telescope").load_extension("lazygit")
  end,

  setup = function()
    -- api.nvim_del_keymap("n", "<leader>fb")
    --   -- map("n", "<leader>fb", "<cmd> :Telescope buffers <CR>")
    --   map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
    --   map("n", "<leader>fa", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>")
    --   map("n", "<leader>cm", "<cmd> :Telescope git_commits <CR>")
    --   map("n", "<leader>gt", "<cmd> :Telescope git_status <CR>")
    --   map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>")
    --   map("n", "<leader>fw", "<cmd> :Telescope live_grep <CR>")
    --   map("n", "<leader>fo", "<cmd> :Telescope oldfiles <CR>")
    --   map("n", "<leader>th", "<cmd> :Telescope themes <CR>")
    --   map("n", "<leader>tk", "<cmd> :Telescope keymaps <CR>")
    --
    --   -- pick a hidden term
    --   map("n", "<leader>W", "<cmd> :Telescope terms <CR>")
  end,

  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
    },
  },
}

M.treesitter = {
  ensure_installed = {
    -- markup
    "css",
    "html",
    "latex",
    "scss",

    -- scripting
    "bash",
    "fish",

    -- programming languages
    "c",
    "cpp",
    "go",
    "java",
    "javascript",
    "lua",
    "php",
    "python",
    "ruby",
    "rust",
    "typescript",

    -- language specifics
    "prisma",
    "tsx",
    "vue",

    -- comm
    "graphql",
    "json",
    "yaml",

    -- tools
    "cmake",
    "dockerfile",
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.comment = {
  pre_hook = function(ctx)
    local U = require("Comment.utils")

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring({
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    })
  end,
}

return M
