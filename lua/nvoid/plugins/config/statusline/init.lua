local config = require('nvoid.core.def-config').ui.statusline_style
if config == 'nvoid' then
    require("nvoid/plugins/config/statusline/nvoid")
elseif config == 'evil' then
    require("nvoid/plugins/config/statusline/evil")
end
