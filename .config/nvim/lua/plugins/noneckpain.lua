

require("no-neck-pain").setup({
    -- The width of the focused buffer when enabling NNP.
    -- If the available window size is less than `width`, the buffer will take the whole screen.
    width = 120,
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
    -- Disables NNP if the last valid buffer in the list has been closed.
    disableOnLastBuffer = false,
    -- When `true`, disabling NNP kills every split/vsplit buffers except the main NNP buffer.
    killAllBuffersOnDisable = false,
    --- Common options that are set to both buffers, for option scoped to the `left` and/or `right` buffer, see `buffers.left` and `buffers.right`.
    --- See |NoNeckPain.bufferOptions|.
    buffers = {
        -- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
        setNames = false,
        -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
        -- popular theme are supported by their name:
        -- - catppuccin-frappe
        -- - catppuccin-frappe-dark
        -- - catppuccin-latte
        -- - catppuccin-latte-dark
        -- - catppuccin-macchiato
        -- - catppuccin-macchiato-dark
        -- - catppuccin-mocha
        -- - catppuccin-mocha-dark
        -- - tokyonight-day
        -- - tokyonight-moon
        -- - tokyonight-night
        -- - tokyonight-storm
        -- - rose-pine
        -- - rose-pine-moon
        -- - rose-pine-dawn
        backgroundColor = nil,
        -- buffer-scoped options: any `vim.bo` options is accepted here.
        bo = {
            filetype = "no-neck-pain",
            buftype = "nofile",
            bufhidden = "hide",
            modifiable = false,
            buflisted = false,
            swapfile = false,
        },
        -- window-scoped options: any `vim.wo` options is accepted here.
        wo = {
            cursorline = false,
            cursorcolumn = false,
            number = false,
            relativenumber = false,
            foldenable = false,
            list = false,
        },
        --- Options applied to the `left` buffer, the options defined here overrides the ones at the root of the `buffers` level.
        --- See |NoNeckPain.bufferOptions|.
        left = NoNeckPain.bufferOptions,
        --- Options applied to the `right` buffer, the options defined here overrides the ones at the root of the `buffers` level.
        --- See |NoNeckPain.bufferOptions|.
        right = NoNeckPain.bufferOptions,
    },
    -- lists supported integrations that might clash with `no-neck-pain.nvim`'s behavior
    integrations = {
        -- https://github.com/nvim-tree/nvim-tree.lua
        nvimTree = {
            -- the position of the tree, can be `left` or `right``
            position = "left",
        },
    },
})

vim.api.nvim_create_augroup("OnVimEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = "OnVimEnter",
	pattern = "*",
	callback = function()
		vim.schedule(function()
			require("no-neck-pain").enable()
		end)
	end,
})
