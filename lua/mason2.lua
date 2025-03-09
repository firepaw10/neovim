-- Ensure mason is loaded before mason-lspconfig
local status_mason, mason = pcall(require, "mason")
if not status_mason then
  vim.notify("Mason is not installed!", vim.log.levels.ERROR)
  return
end

local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then
  vim.notify("mason-lspconfig is not installed!", vim.log.levels.ERROR)
  return
end

-- Now you can safely require lspconfig
local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
  vim.notify("nvim-lspconfig is not installed!", vim.log.levels.ERROR)
  return
end

-- Set up mason
mason.setup()

-- Set up mason-lspconfig
mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls" },
  automatic_installation = true,
})

-- Set up LSP servers
local servers = { "lua_ls", "pyright", "ts_ls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({})
end
