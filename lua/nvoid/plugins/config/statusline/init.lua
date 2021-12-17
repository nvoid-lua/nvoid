local config = require('nv-config').ui.statusline_style
if config == 'nvoid' then
    require("nvoid/plugins/config/statusline/nvoid")
elseif config == 'evil' then
    require("nvoid/plugins/config/statusline/evil")
end
