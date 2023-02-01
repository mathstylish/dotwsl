-- vim options
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>q"] = ":q<cr>"
lvim.keys.normal_mode["<leader>vs"] = ":vsplit<cr>"
lvim.keys.normal_mode["<leader>vh"] = ":split<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["kj"] = "<Esc>"
-- Delete a word backwards
lvim.keys.normal_mode["db"] = 'vb"_d'
-- Better paste
lvim.keys.visual_mode["p"] = '"_dP'
-- '-' to end of line
lvim.keys.normal_mode["-"] = "$"
lvim.keys.visual_mode["-"] = "$"


local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  n = {
    ["q"] = actions.close
  },
  i = {
    ["<Down>"] = actions.cycle_history_next,
    ["<Up>"] = actions.cycle_history_prev,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  }
}

lvim.builtin.which_key.mappings["f"] = {
  name = "+Telescope",
  f = { "<cmd>Telescope find_files<CR>", "Find Files" },
  t = { "<cmd>Telescope live_grep<CR>", "Search Text" },
  p = { "<cmd>Telescope projects<CR>", "Projects" },
  b = { "<cmd>Telescope buffers<CR>", "Show Buffers" }
}

-- -- Change theme settings
lvim.colorscheme = "lunar"
lvim.transparent_window = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "clang-format",
    extra_args = { "--style", "LLVM" },
    filetypes = { "c" },
  },
}
-- c encoding problem workaround
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)

lvim.plugins = {
  { "mfussenegger/nvim-jdtls", ft = { "java" } },
}

-- lvim.builtin.dap.active = true

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
-- lvim.builtin.dap.on_config_done = function(dap)
--   dap.adapters.codelldb = {
--     type = "server",
--     port = "${port}",
--     executable = {
--       -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
--       command = "codelldb",
--       args = { "--port", "${port}" },

--       -- On windows you may have to uncomment this:
--       -- detached = false,
--     },
--   }

--   dap.configurations.cpp = {
--     {
--       name = "Launch file",
--       type = "codelldb",
--       request = "launch",
--       program = function()
--         local path
--         vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
--           path = input
--         end)
--         vim.cmd [[redraw]]
--         return path
--       end,
--       cwd = "${workspaceFolder}",
--       stopOnEntry = false,
--     },
--   }

--   dap.configurations.c = dap.configurations.cpp
-- end



-- lvim.autocommands = {
--   {
--     "BufEnter", {
--       pattern = { "*.c", "*.h" },
--       callback = function()
--         vim.cmd [[setlocal tabstop=4 shiftwidth=4]]
--       end
--     }
--   }
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     command = "cpplint",
--     args = { "--filter", "-legal/copyright" },
--     filetypes = { "c" },
--   }
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })- })
