local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    'bashls',
    'lua_ls',
	'rust_analyzer',
    'gopls',
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'copilot'},
        {name = 'nvim_lsp'},
    },
--    mapping = {
--        ['<CR>'] = cmp.mapping.confirm({
--            behavior = cmp.ConfirmBehavior.Replace,
--            select = false,
--        })
--    }
})

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
})

lsp.set_preferences({
	-- sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.open_float() end, opts)
--	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
--	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
