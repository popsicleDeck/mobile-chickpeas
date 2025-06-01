vim.api.nvim_create_augroup("myAutocmd", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "myAutocmd",
	pattern = "*.py",
	callback = function()
		local bufnr = tonumber(vim.fn.input("Bufnr to print output: "))
		if not vim.api.nvim_buf_is_valid(bufnr) then
			vim.notify("Bufnr not exists")
			bufnr = tonumber(vim.fn.input("Please re-enter: "))
		end
		local fname = vim.fn.input("Filename: ")
		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Output:" })
		local append_data = function(_, data)
			if data then
				vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
			end
		end

		vim.fn.jobstart({ "python3", fname }, {
			stdout_buffered = true,
			on_stdout = append_data,
			on_stderr = append_data,
		})
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "myAutocmd",
	callback = function()
		vim.hl.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})
