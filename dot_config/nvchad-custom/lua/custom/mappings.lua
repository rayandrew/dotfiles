local map = nvchad.map

-- Keybindings
local silent = { silent = true }

-- Buffers
map("n", "<leader>fs", "<cmd>w<cr>", silent)
map("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", silent)
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", silent)

---- Window
map("n", "<leader>ws", "<cmd>split<cr>", silent) -- split horizontal
map("n", "<leader>wv", "<cmd>vsplit<cr>", silent) -- split vertical
map("n", "<leader>wq", "<c-w>q") -- quit
map("n", "<leader>wh", "<c-w>h") -- go to window left
map("n", "<leader>wj", "<c-w>j") -- go to window bottom
map("n", "<leader>wk", "<c-w>k") -- go to window up
map("n", "<leader>wl", "<c-w>l") -- go to window right

