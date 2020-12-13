VERSION = "1.1.2"

local config = import("micro/config")

function init()
  config.AddRuntimeFile("nord-tc-t", "colorscheme", "nord-tc.micro")
  config.AddRuntimeFile("nord-16-t", "colorscheme", "nord-16.micro")
  config.AddRuntimeFile("nord-tc-light-t", "colorscheme", "nord-tc-light.micro")
  config.AddRuntimeFile("nord-16-light-t", "colorscheme", "nord-16-light.micro")
end
