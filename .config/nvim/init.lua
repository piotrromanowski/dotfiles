require 'options'

local fn = vim.fn

-- Automatically install Packer if it's not already installed
local install_path =
  ("%s/site/pack/packer/opt/packer.nvim"):format(fn.stdpath("data"))

if fn.empty(fn.glob(install_path)) > 0 then
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  fn.system({ "git", "clone", packer_repo, install_path })
end

local modules = {
  "mappings",
  "pluginList",
  "utils",
}

local async
async = vim.loop.new_async(
  vim.schedule_wrap(
    function()
      for i = 1, #modules, 1 do
        local ok, res = xpcall(require, debug.traceback, modules[i])
        if not (ok) then
          print("Error loading module:  " .. modules[i])
          print(res)
        end
      end
      async:close()
    end
  )
)

async:send()
