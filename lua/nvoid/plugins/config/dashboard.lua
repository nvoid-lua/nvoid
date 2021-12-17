local g = vim.g

local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
g.dashboard_default_executive = "telescope"

vim.cmd([[
let g:dashboard_custom_header =<< trim END
b.             8 `8.`888b           ,8' 
888o.          8  `8.`888b         ,8'  
Y88888o.       8   `8.`888b       ,8'   
.`Y888888o.    8    `8.`888b     ,8'    
8o. `Y888888o. 8     `8.`888b   ,8'     
8`Y8o. `Y88888o8      `8.`888b ,8'      
8   `Y8o. `Y8888       `8.`888b8'       
8      `Y8o. `Y8        `8.`888'        
8         `Y8o.`         `8.`8'         
8            `Yo          `8.`          
END
]])


g.dashboard_disable_statusline = 0
local nvoid_site = "  爵ysfgrgo7.github.io"
g.dashboard_custom_footer = {
  "NVOID Loaded " .. plugins_count .. " plugins  ",
  "",
  nvoid_site,
}

g.dashboard_custom_section = {
   a = { description = { "  Find File        " }, command = "Telescope find_files" },
   c = { description = { "  Recents          " }, command = "Telescope oldfiles" },
   d = { description = { "  Colorschemes     " }, command = "Telescope colorscheme" },
   e = { description = { "  New File         " }, command = "DashboardNewFile" },
   f = { description = { "煉 Settings         " }, command = "e ~/.config/nvim/lua/nv-config.lua" },
   g = { description = { "  Load Last Session" }, command = "SessionLoad" },
}
