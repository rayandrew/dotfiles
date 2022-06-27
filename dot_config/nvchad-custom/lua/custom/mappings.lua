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
    -- navigate within normal mode
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  i = {
    -- navigate within insert mode
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
    ["<leader>fs"] = { "<cmd> :w <CR>", "﬚  save file" },
    ["<leader>bd"] = { "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", "close current buffer" },
    ["<leader>bb"] = { "<cmd> :Telescope buffers <CR>", "show list of buffers" },
    ["<leader>sp"] = { "<cmd> :Telescope live_grep<CR>", "search text in current directory" },
    ["<leader>bc"] = { "<cmd> :%bd|e# <CR>", "close all buffers except this one"},
    ["<leader>ba"] = { "<cmd> :bufdo bd <CR>", "close all buffers"}
  },
}

M.window = {
  n = {
    ["<leader>ws"] = { "<cmd> :split <CR>", "split window horizontally" },
    ["<leader>wv"] = { "<cmd> :vsplit <CR>", "split window vertically" },
    ["<leader>wq"] = { "<C-w>q", "quit curent window" },
    ["<leader>wh"] = { "<C-w>h", "go to left window" },
    ["<leader>wj"] = { "<C-w>j", "go to bottom window" },
    ["<leader>wk"] = { "<C-w>k", "go to upper window" },
    ["<leader>wl"] = { "<C-w>l", "go to right window" },
    ["<C-k>"] = { '<cmd> lua require("tmux").move_top() <CR>', "go to upper window" },
    ["<C-j>"] = { '<cmd> lua require("tmux").move_bottom() <CR>', "go to bottom window" },
  },
}

M.ranger = {
  n = {
    ["<leader>fm"] = { "<cmd> :Ranger <CR>", "open ranger file manager" },
  },
}

M.git = {
  n = {
    -- ["<leader>gg"] = { "<cmd> :Neogit <CR>", "open neogit" },
    ["<leader>gg"] = { "<cmd> ::LazyGit <CR>", "open lazygit" },
    ["<leader>gc"] = { "<cmd> ::LazyGitConfig <CR>", "open lazygit config" },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd> :Trouble <CR>", "open trouble" },
    ["<leader>xw"] = { "<cmd> :Trouble workspace_diagnostics <CR>", "open trouble workspace diagnostics" },
    ["<leader>xd"] = { "<cmd> :Trouble document_diagnostics <CR>", "open trouble document diagnostics" },
    ["<leader>xl"] = { "<cmd> :Trouble loclist <CR>", "open trouble loclist" },
    ["<leader>xq"] = { "<cmd> :Trouble quickfix <CR>", "open trouble quickfix" },
  },
}

return M
