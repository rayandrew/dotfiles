local api = vim.api
local map = nvchad.map

-- Keybindings
local silent = { silent = true }

-- Buffers
map("n", "<leader>fs", "<cmd> :w <CR>", silent)
map("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", silent)
map("n", "<leader>bb", "<cmd> :Telescope buffers<CR>", silent)
map("n", "<leader>sp", "<cmd> :Telescope live_grep<CR>", silent)

-- Window
map("n", "<leader>ws", "<cmd> :split <CR>", silent) -- split horizontal
map("n", "<leader>wv", "<cmd> :vsplit <CR>", silent) -- split vertical
map("n", "<leader>wq", "<C-w>q") -- quit
map("n", "<leader>wh", "<C-w>h") -- go to window left
map("n", "<leader>wj", "<C-w>j") -- go to window bottom
map("n", "<leader>wk", "<C-w>k") -- go to window up
map("n", "<leader>wl", "<C-w>l") -- go to window right

-- Ranger
api.nvim_del_keymap("t", "jk")
map("n", "<leader>fm", "<cmd> :Ranger <CR>")

-- Git
map("n", "<leader>gg", "<cmd> :Neogit <CR>")
