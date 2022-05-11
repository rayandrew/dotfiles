local api = vim.api
local map = nvchad.map

-- Keybindings
local silent = { silent = true }

-- Buffers
map("n", "<leader>fs", "<cmd> :w <CR>", silent)
map("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", silent)
map("n", "<leader>bb", "<cmd> :Telescope buffers<CR>", silent)

-- Window
map("n", "<leader>ws", "<cmd> :split <CR>", silent) -- split horizontal
map("n", "<leader>wv", "<cmd> :vsplit <CR>", silent) -- split vertical
map("n", "<leader>wq", "<c-w>q") -- quit
map("n", "<leader>wh", "<c-w>h") -- go to window left
map("n", "<leader>wj", "<c-w>j") -- go to window bottom
map("n", "<leader>wk", "<c-w>k") -- go to window up
map("n", "<leader>wl", "<c-w>l") -- go to window right


-- api.nvim_del_keymap("n", "<leader>fb")
api.nvim_del_keymap("t", "jk" )

-- Ranger
map("n", "<leader>fm", "<cmd> :RnvimrToggle <CR>", { noremap = true, silent = true})
map("t", "<leader>fm", "<cmd> :RnvimrToggle <CR>", { noremap = true, silent = true})

-- map("n", "<leader>fb", "<cmd>Ranger<cr>", silent)
