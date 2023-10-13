function Paint(color)
	color = color or "rose-pine-main"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

Paint()
