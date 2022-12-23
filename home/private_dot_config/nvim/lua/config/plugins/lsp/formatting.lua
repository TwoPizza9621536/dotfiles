local M = {}

function M.setup(client, buf)
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = buf }
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = buf,
            callback = function()
                vim.lsp.buf.format { bufnr = buf }
            end,
        })
    end
end

return M
