M = {}

M.analyzing_commits = { { "Analyzing commits...", "String" } }

M.analyzing_commits_done_breaking_changes = { { "Analyzing commits... Done", "String" } }

M.analyzing_commits_done_no_breaking_changes = { { "No breaking changes in commit list - Analyzed", "Title" } }

M.applied_commits = { { "Applied Commits:\n", "Title" } }

M.breaking_changes_found = { { "\nFound", "Title" }, { " <BREAKING_CHANGES_COUNT> " }, { "potentially breaking ", "Title" }, { "<HR_CHANGE>", "Title" }, { ":\n", "Title" } }

M.checking_for_updates = { { "Checking for updates...", "String" } }

M.checkout_failed = { { "\nChecking out the currently set update branch ", "WarningMsg" }, { "<BRANCH_NAME>" }, { " failed. Please make sure that it exists before trying to update!", "WarningMsg" } }

M.clean_repo_dir_failed = { { "Error: Could not clean up the repo.", "ErrorMsg" } }

M.clean_repo_dir_success = { { "Cleanup successful!\n\n", "Title" } }

M.commit_summary_failed = { { "Could not create a commit summary.\n", "WarningMsg" } }

M.diverged_branches = { { "\nSomething went wrong. No new commits were received even though the remote's HEAD " .. "differs from the currently checked out HEAD.", "Title", }, { "\n\nWould you like to reset Nvoid to the remote's HEAD? Local changes will be lost! " .. "[y/N]", "WarningMsg", } }

M.modifications_detected = { { "Warning\n  Modification to repo files detected.\n\n  Updater will run", "WarningMsg" }, { " git reset --hard " }, { "in config folder, so changes to existing repo files except ", "WarningMsg" }, { "lua/custom folder" }, { " will be lost!\n", "WarningMsg" } }

M.modifications_detected_stash = { { "Local changes outside of the custom directory detected. " .. 'They have been stashed with "git stash"!\n', "WarningMsg", } }

M.modifications_detected_stash_restore_failed = { { "\nApplying stashed changes to the Nvoid" .. 'directory failed, please resolve the conflicts manually and use "git stash pop" to ' .. 'restore or "git stash drop" to discard them!\n ', "WarningMsg", } }

M.modifications_detected_stash_restored = { { "Local changes have been restored succesfully.\n", "WarningMsg" } }

M.new_commits_summary = { { "There ", "Title" }, { "<HR_HAVE>", "Title" }, { " been", "Title" }, { " <HR_NEW_COMMIT_LIST> " }, { "new ", "Title" }, { "<HR_COMMITS>", "Title" }, { " since the last update:\n", "Title" } }

M.no_modifications_detected = { { "No conflicting changes outside of the custom folder, ready to update.", "Title" } }

M.not_a_git_dir = { { "Error: ", "ErrorMsg" }, { "<CONFIG_PATH>", "ErrorMsg" }, { " is not a valid git directory.\n", "ErrorMsg" } }

M.packer_sync = { { "Would you like to run ", "WarningMsg" }, { "PackerSync" }, { " after the update has completed?\n", "WarningMsg" }, { "Not running ", "WarningMsg" }, { "PackerSync" }, { " may break Nvoid! ", "WarningMsg" }, { "[y/N]", "WarningMsg" } }

M.remote_head_changes_fetch_failed = { { "Error: Could not fetch remote changes.", "ErrorMsg" } }

M.remote_head_fetching_changes = { { "Fetching new changes from remote...", "String" } }

M.remote_head_sha_fetch_failed = { { "Error: Could not fetch remote HEAD sha.", "ErrorMsg" } }

M.remote_info = { { "Url: ", "Title" }, { "<UPDATE_URL>" }, { "\nBranch: ", "Title" }, { "<UPDATE_BRANCH>" }, { "\n\n" } }

M.removing_tmp_commit = { { "Removing tmp commit. This has not been removed properly after the " .. "last update. Cleaning up...\n\n", "WarningMsg", } }

M.reset_remote_head = { { "Resetting to remote HEAD...", "Title" } }

M.reset_remote_head_failed = { { "Error: Could not reset to remote HEAD.", "ErrorMsg" } }

M.reset_remote_head_success = { { "Nvoid's HEAD has successfully been reset to ", "Title" }, { "<UPDATE_BRANCH>" }, { ".\n\n", "Title" } }

M.reset_remote_head_success_status = { { "Reset to remote HEAD successful!\n\n", "Title" }, { "<RESET_STATUS>", "String" }, { "\n", "String" } }

M.update_cancelled = { { "Update cancelled!", "Title" } }

M.update_cancelled_up_to_date = { { "You are already up to date with ", "String" }, { "<UPDATE_BRANCH>" }, { ". There is nothing to do!", "String" } }

M.update_confirm = { { "\nUpdate Nvoid? [y/N]", "WarningMsg" } }

M.update_continue = { { "\nWould you still like to continue with the update? [y/N]", "WarningMsg" } }

M.update_failed = { { "\nError: Nvoid Update failed.", "ErrorMsg" } }

M.update_failed_changes_restored = { { "Error: Nvoid Update failed.\n\n", "ErrorMsg" }, { "Local changes were restored." } }

M.update_success = { { "\nNvoid succesfully updated.\n", "String" } }

return M
