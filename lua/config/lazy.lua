-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup leaser before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	{
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
	  vim.cmd([[colorscheme tokyonight-night]])
	  vim.cmd.highlight({ "Comment", "guifg=#6c76ad" })
	end,
	},
    -- LSP config
	{
	    "neovim/nvim-lspconfig",
	    dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	    },
	    config = function()
		require("mason").setup {
		    log_level = vim.log.levels.DEBUG
		}
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers {
		    function(server_name) -- default non-specific handler
			require("lspconfig")[server_name].setup {}
			end,
		       ["lua_ls"] = function ()
		       require("lspconfig").lua_ls.setup {
			   settings = {
			       Lua = {
			       --avoid lua's diagnostic "underfined global"}
				   diagnostics = {
				       globals = { "vim" }
				   }
			       }
			   }
		       }
		   end,
		 }
	      end,
	}

    -- Formatter: using conform.nvim
})
