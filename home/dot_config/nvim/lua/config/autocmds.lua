local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("set_two_space_indent"),
  pattern = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "typescript",
    "typescriptreact",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("set_eight_space_indent"),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.shiftwidth = 8
  end,
})

-- Fix Omnisharp completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("omnisharp_lsp_fix"),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local function toSnakeCase(str)
      return string.gsub(str, "%s*[- ]%s*", "_")
    end

    if client.name == "omnisharp" then
      local tokenModifiers =
        client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        tokenModifiers[i] = toSnakeCase(v)
      end
      local tokenTypes =
        client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = toSnakeCase(v)
      end
    end
  end,
})
