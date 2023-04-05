#Requires -Version 7.1
$ErrorActionPreference = "Stop" # exit when command fails

$env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
$env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA
$env:XDG_CACHE_HOME = $env:XDG_CACHE_HOME ?? $env:TEMP

$env:NVOID_RUNTIME_DIR = $env:NVOID_RUNTIME_DIR ?? "$env:XDG_DATA_HOME\nvoid"
$env:NVOID_CONFIG_DIR = $env:NVOID_CONFIG_DIR ?? "$env:XDG_CONFIG_HOME\nvoid"
$env:NVOID_CACHE_DIR = $env:NVOID_CACHE_DIR ?? "$env:XDG_CACHE_HOME\nvoid"
$env:NVOID_BASE_DIR = $env:NVOID_BASE_DIR ?? "$env:NVOID_RUNTIME_DIR\nvoid"

nvim -u "$env:NVOID_BASE_DIR\init.lua" @args