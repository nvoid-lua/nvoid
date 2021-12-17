local config = require('nv-config').ui.statusline_style
if config == 'nvoid' then
    require("plugins/statusline/nvoid")
elseif config == 'evil' then
    require("plugins/statusline/evil")
end
