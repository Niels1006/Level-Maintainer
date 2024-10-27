local shell = require("shell")
local filesystem = require("filesystem")
local scripts = {"src/AE2.lua", "src/Utility.lua", "Maintainer.lua"}

local paths = {"src", "lib"}

local function exists(filename)
    return filesystem.exists(shell.getWorkingDirectory() .. "/" .. filename)
end

local repo = "https://raw.githubusercontent.com/Niels1006/Infinite-Maintainer/";
local branch = "1.12"

for i = 1, #paths do
    if not filesystem.exists(shell.getWorkingDirectory() .. "/" .. paths[i]) then
        filesystem.makeDirectory(shell.getWorkingDirectory() .. "/" .. paths[i]);
    end
end

for i = 1, #scripts do
    if exists(scripts[i]) then
        filesystem.remove(shell.getWorkingDirectory() .. "/" .. scripts[i]);
    end

    shell.execute(string.format("wget %s%s/%s %s", repo, branch, scripts[i], scripts[i]));
end

if not exists("config.lua") then
    shell.execute(string.format("wget %s%s/config.lua", repo, branch));
end

shell.execute("reboot");