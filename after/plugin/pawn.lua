vim.api.nvim_create_user_command("Pawn", function(opts)
    vim.cmd("e ++enc=cp1251")
    if(vim.o.filetype == "pov" or vim.o.filetype == "pwn") then
        vim.cmd("set ft=c")
    end
end, { nargs = 0 })
