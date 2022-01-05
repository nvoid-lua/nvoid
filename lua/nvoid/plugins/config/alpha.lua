local present, alpha = pcall(require, "alpha")
if not present then
   return
end

local header = {
    type = "text",
    val = {
[[]],
[[ ███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗  ]],
[[ ████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗ ]],
[[ ██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║ ]],
[[ ██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║ ]],
[[ ██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝ ]],
[[]],
    },
    opts = {
        position = "center",
        hl = "AlphaHeader"
    }
}

local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
local plugins = handle:read("*a")
handle:close()

local plugin_count = {
    type = "text",
    val = "Nvoid Loaded " .. plugins .. " plugins  ",
    opts = {
        position = "center",
        hl = "AlphaHeader",
    }
}

local footer = {
    type = "text",
    val = "爵 nvoid.org",
    opts = {
        position = "center",
        hl = "AlphaFooter",
    }
}

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 20,
        align_shortcut = "right",
        hl_shortcut = "AlphaButtons",
        hl = "AlphaButtons",
    }
    if keybind then
        opts.keymap = {"n", sc_, keybind, {noremap = true, silent = true}}
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
    button( "n", "  > New file" ,   ":enew<CR>"),
    button( "f", "  > Find file",   ":Telescope find_files<CR>"),
    button( "o", "  > Recent"   ,   ":Telescope oldfiles<CR>"),
    button( "e", "  > Edit Confg" , ":e ~/.config/nvim/lua/custom/nvoidrc.lua<CR>"),
    button( "c", "  > ColorScheme", ":Telescope colorscheme<CR>"),
    button( "q", "  > Quit NVIM",   ":qa<CR>"),
    },
    opts = {
        spacing = 1,
    }
}

local section = {
    header = header,
    buttons = buttons,
    plugin_count = plugin_count,
    footer = footer
}

local opts = {
    layout = {
        {type = "padding", val = 2},
        section.header,
        {type = "padding", val = 1},
        section.heading,
        section.plugin_count,
        {type = "padding", val = 1},
        section.buttons,
        {type = "padding", val = 1},
        section.footer,
    },
    opts = {
        margin = 5
    },
}
alpha.setup(opts)
