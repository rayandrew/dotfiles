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
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
    },
  },
}

return M
