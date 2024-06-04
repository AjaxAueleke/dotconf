-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "ellisonleao/gruvbox.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/playground")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_fit = {
				python = { "djlint" },
				javascript = { "eslint_d" },
			}
		end,
	})

	use({
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					python = { "black" },
					javascript = { "prettier" },
					lua = { "stylua" },
					go = { "gofumpt" },
				},
			})
			-- Define the formatting function outside the keymap to clarify scope
			local function format_code()
				local ok, err = require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				if not ok then
					-- Print the error message if formatting fails
					print("Error formatting: " .. err)
				end
			end
			vim.keymap.set({ "n", "v" }, "<leader>l", format_code, { desc = "Format file or range (in visual mode)" })
		end,
	})
	use({
		"mfussenegger/nvim-dap",
	})
    use ({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
