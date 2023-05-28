#Requires -Version 7.1
$ErrorActionPreference = "Stop" # exit when command fails

# set script variables
$LV_BRANCH = $LV_BRANCH ?? "master"
$LV_REMOTE = $LV_REMOTE ?? "nvoid/nvoid.git"
$INSTALL_PREFIX = $INSTALL_PREFIX ?? "$HOME\.local"

$env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
$env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
$env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP

$env:NVOID_RUNTIME_DIR = $env:NVOID_RUNTIME_DIR ?? "$env:XDG_DATA_HOME\nvoid"
$env:NVOID_BASE16_DIR = $env:NVOID_BASE16_DIR ?? "$XDG_DATA_HOME/nvoid/site/pack/packer/start/base16/lua/base16/highlight"
$env:NVOID_CONFIG_DIR = $env:NVOID_CONFIG_DIR ?? "$env:XDG_CONFIG_HOME\nvoid"
$env:NVOID_CACHE_DIR = $env:NVOID_CACHE_DIR ?? "$env:XDG_CACHE_HOME\nvoid"
$env:NVOID_BASE_DIR = $env:NVOID_BASE_DIR ?? "$env:NVOID_RUNTIME_DIR\nvoid"

$__nvoid_dirs = (
  $env:NVOID_BASE_DIR,
  $env:NVOID_BASE16_DIR,
  $env:NVOID_RUNTIME_DIR,
  $env:NVOID_CONFIG_DIR,
  $env:NVOID_CACHE_DIR
)

function main($cliargs) {
  Write-Output "Removing Nvoid binary..."
  remove_nvoid_bin
  Write-Output "Removing Nvoid directories..."
  $force = $false
  if ($cliargs.Contains("--remove-backups")) {
    $force = $true
  }
  remove_nvoid_dirs $force
  Write-Output "Uninstalled Nvoid!"
}

function remove_nvoid_bin() {
  $nvoid_bin = "$INSTALL_PREFIX\bin\nvoid"
  if (Test-Path $nvoid_bin) {
    Remove-Item -Force $nvoid_bin
  }
  if (Test-Path alias:nvoid) {
    Write-Warning "Please make sure to remove the 'nvoid' alias from your `$PROFILE`: $PROFILE"
  }
}

function remove_nvoid_dirs($force) {
  foreach ($dir in $__nvoid_dirs) {
    if (Test-Path $dir) {
      Remove-Item -Force -Recurse $dir
    }
    if ($force -eq $true) {
      if (Test-Path "$dir.bak") {
        Remove-Item -Force -Recurse "$dir.bak"
      }
      if (Test-Path "$dir.old") {
        Remove-Item -Force -Recurse "$dir.old"
      }
    }
  }
}

main($args)
