	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "emmet_language_server", "basedpyright" },
			})
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end
	}

