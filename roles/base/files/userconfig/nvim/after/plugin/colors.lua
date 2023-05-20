function SetColortheme(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	-- make background transparent again
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

SetColortheme()
