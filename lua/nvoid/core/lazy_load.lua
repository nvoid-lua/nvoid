local M = {}
local autocmd = vim.api.nvim_create_autocmd
-- Thanks for the  nvchad repo

M.lazy_load = function(tb)
  autocmd(tb.events, {
    group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
    callback = function()
      if tb.condition() then
        vim.api.nvim_del_augroup_by_name(tb.augroup_name)

        if tb.plugin ~= "nvim-treesitter" then
          vim.defer_fn(function()
            require("packer").loader(tb.plugin)
            if tb.plugin == "nvim-lspconfig" then
              vim.cmd("silent! do FileType")
            end
          end, 0)
        else
          require("packer").loader(tb.plugin)
        end
      end
    end,
  })
end

M.on_file_open = function(plugin_name)
  M.lazy_load({
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = "BeLazyOnFileOpen" .. plugin_name,
    plugin = plugin_name,
    condition = function()
      local file = vim.fn.expand("%")
      return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
    end,
  })
end

M.treesitter_cmds = {
  "TSInstall",
  "TSBufEnable",
  "TSBufDisable",
  "TSEnable",
  "TSDisable",
  "TSModuleInfo",
}

M.gitsigns = function()
  autocmd({ "BufRead" }, {
    callback = function()
      vim.fn.system("git rev-parse 2>/dev/null " .. vim.fn.expand("%:p:h"))
      if vim.v.shell_error == 0 then
        vim.schedule(function()
          require("packer").loader("gitsigns.nvim")
        end)
      end
    end,
  })
end

return M
