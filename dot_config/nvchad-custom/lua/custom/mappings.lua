-- local api = vim.api
-- local map = nvchad.map
--
-- -- Keybindings
-- local silent = { silent = true }
--
-- -- Buffers
-- map("n", "<leader>fs", "<cmd> :w <CR>", silent)
-- map("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", silent)
-- map("n", "<leader>bb", "<cmd> :Telescope buffers<CR>", silent)
-- map("n", "<leader>sp", "<cmd> :Telescope live_grep<CR>", silent)
--
-- -- Window
-- map("n", "<leader>ws", "<cmd> :split <CR>", silent) -- split horizontal
-- map("n", "<leader>wv", "<cmd> :vsplit <CR>", silent) -- split vertical
-- map("n", "<leader>wq", "<C-w>q") -- quit
-- map("n", "<leader>wh", "<C-w>h") -- go to window left
-- map("n", "<leader>wj", "<C-w>j") -- go to window bottom
-- map("n", "<leader>wk", "<C-w>k") -- go to window up
-- map("n", "<leader>wl", "<C-w>l") -- go to window right
--
-- -- Ranger
-- map("n", "<leader>fm", "<cmd> :Ranger <CR>")
--
-- -- Git
-- map("n", "<leader>gg", "<cmd> :Neogit <CR>")
--

local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
      ["<C-h"] = "",
      -- navigate within insert mode
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
  },
  i = {
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
  },
  t = {
      ["jk"] = "",
  },
}

M.buffer = {
  n = {
    ["<leader>fs"] = { "<cmd> :w <CR>", "﬚  save file"},
    ["<leader>bd"] = {"<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", "close current buffer"},
    ["<leader>bb"]  = {"<cmd> :Telescope buffers <CR>", "show list of buffers"},
    ["<leader>sp"]  = {"<cmd> :Telescope live_grep<CR>", "search text in current directory"},
  }
}

M.window = {
  n = {
    ["<leader>ws"] = {"<cmd> :split <CR>", "split window horizontally"},
    ["<leader>wv"] = {"<cmd> :vsplit <CR>", "split window vertically"},
    ["<leader>wq"] = {"<C-w>q", "quit curent window"},
    ["<leader>wh"] = {"<C-w>h", "go to left window"},
    ["<leader>wj"] = {"<C-w>j", "go to bottom window"},
    ["<leader>wk"] = {"<C-w>k", "go to upper window"},
    ["<leader>wl"] = {"<C-w>l", "go to right window"},
  }
}

M.ranger = {
  n = {
    ["<leader>fm"] = {"<cmd> :Ranger <CR>", "open ranger file manager"},
  }
}

M.git = {
  n = {
    ["<leader>gg"] = {"<cmd> :Neogit <CR>", "open neogit"},
  }
}

return M
