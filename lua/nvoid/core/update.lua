local function update()
   local config_path = vim.fn.stdpath "config"
   local config_file = config_path .. "/lua/" .. "nvoidrc.lua"
   local config_file_backup = config_path .. "/" .. "nvoidrc.lua.bak." .. math.random()
   local utils = require "nvoid"
   local echo = utils.echo
   local current_config = require("nvoid.core.utils").load_config()
   local update_url = current_config.options.nvoid.update_url or "https://github.com/ysfgrgO7/nvoid"
   local update_branch = current_config.options.nvoid.update_branch or "main"
   local current_sha, backup_sha = "", ""
   local function restore_repo_state()
      vim.fn.system(
         "git -C "
            .. config_path
            .. " reset --hard "
            .. current_sha
            .. " ; git -C "
            .. config_path
            .. " cherry-pick -n "
            .. backup_sha
            .. " ; git reset"
      )
   end

   local function rm_backup()
      if not pcall(os.remove, config_file_backup) then
         echo { { "Warning: Failed to remove backup nvoidrc, remove manually.", "WarningMsg" } }
         echo { { "Path: ", "WarningMsg" }, { config_file_backup } }
      end
   end

   local config_contents = utils.file("r", config_file)
   utils.file("w", config_file_backup, config_contents)
   utils.file("w", config_file, config_contents)

   local valid_git_dir = true
   current_sha = vim.fn.system("git -C " .. config_path .. " rev-parse HEAD")

   if vim.api.nvim_get_vvar "shell_error" == 0 then
      vim.fn.system("git -C " .. config_path .. " commit -a -m 'tmp'")
      backup_sha = vim.fn.system("git -C " .. config_path .. " rev-parse HEAD")
      if vim.api.nvim_get_vvar "shell_error" ~= 0 then
         valid_git_dir = false
      end
   else
      valid_git_dir = false
   end

   if not valid_git_dir then
      restore_repo_state()
      rm_backup()
      echo { { "Error: " .. config_path .. " is not a git directory.\n" .. current_sha .. backup_sha, "ErrorMsg" } }
      return
   end

   echo { { "Url: ", "Title" }, { update_url } }
   echo { { "Branch: ", "Title" }, { update_branch } }
   echo {
      { "\nUpdater will run", "WarningMsg" },
      { " git reset --hard " },
      {
         "in config folder, so changes to existing repo files except ",
         "WarningMsg",
      },

      { "nvoidrc" },
      { " will be lost!\n\nUpdate Nvoid ? [y/N]", "WarningMsg" },
   }

   local ans = string.lower(vim.fn.input "-> ") == "y"
   utils.clear_cmdline()
   if not ans then
      restore_repo_state()
      rm_backup()
      echo { { "Update cancelled!", "Title" } }
      return
   end

   -- function that will executed when git commands are done
   local function update_exit(_, code)
      -- restore config file irrespective of whether git commands were succesfull or not
      if pcall(function()
         utils.file("w", config_file, config_contents)
      end) then
         -- config restored succesfully, remove backup file that was created
         rm_backup()
      else
         echo { { "Error: Restoring " .. "nvoidrc failed.\n", "ErrorMsg" } }
         echo { { "Backed up " .. "nvoidrc path: " .. config_file_backup .. "\n\n", "None" } }
      end

      -- close the terminal buffer only if update was success, as in case of error, we need the error message
      if code == 0 then
         vim.cmd "bd!"
         echo { { "Nvoid succesfully updated.\n", "String" } }
      else
         restore_repo_state()
         echo { { "Error: Nvoid Update failed.\n", "ErrorMsg" } }
         echo { { "Local changes were restored." } }
      end
   end

   -- reset in case config was modified
   vim.fn.system("git -C " .. config_path .. " reset --hard " .. current_sha)
   -- use --rebase, to not mess up if the local repo is outdated
   local update_script = table.concat({
      "git pull --set-upstream",
      update_url,
      update_branch,
      "--rebase",
   }, " ")

   -- open a new buffer
   vim.cmd "new"
   -- finally open the pseudo terminal buffer
   vim.fn.termopen(update_script, {
      -- change dir to config path so we don't need to move in script
      cwd = config_path,
      on_exit = update_exit,
   })
end

return update
