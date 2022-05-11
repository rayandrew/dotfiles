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
  git = {
    enable = true,
  },
}

M.telescope = {
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

return M
