vim.api.nvim_create_augroup("myAutocmd", { clear = true })
local attach_to_buffer = function(bufnr, pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = "myAutocmd",
		pattern = pattern,
		callback = function()
			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Output:" })
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end

			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

vim.api.nvim_create_user_command("Run", function()
	local bufnr = (tonumber(vim.fn.input("Bufnr: ")))
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(tostring(vim.fn.input("Command to run: ") .. " " .. (vim.api.nvim_buf_get_name(0))), " ")
	attach_to_buffer(bufnr, pattern, command)
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "myAutocmd",
	callback = function()
		vim.hl.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})
