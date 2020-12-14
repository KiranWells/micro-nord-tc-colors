VERSION = "1.1.3"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local action = import("micro/action")
local display = import("micro/display")

function init()
  config.MakeCommand("nordsetup", setup, config.NoComplete)
  config.AddRuntimeFile("nordcolors", config.RTHelp, "help/nordcolors.md")
end

function setup(bp, args)
  -- move the files to the colorscheme directory so that they will work properly
  shell.RunCommand("mkdir \"" .. config.ConfigDir .. "/colorschemes\"")
  shell.RunCommand("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-tc.micro " .. config.ConfigDir .. "/colorschemes/")
  shell.RunCommand("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-16.micro " .. config.ConfigDir .. "/colorschemes/")
  shell.RunCommand("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-tc-light.micro " .. config.ConfigDir .. "/colorschemes/")
  shell.RunCommand("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-16-light.micro " .. config.ConfigDir .. "/colorschemes/")
  results = shell.RunCommand("ls " .. config.ConfigDir .. "/colorschemes")

  -- make sure the files have been moved properly
  ok = results:find("nord", 1, true) ~= nil

  if ok then
    -- we are good, say that and move on
    micro.InfoBar():Message("Finished setting up")
  else
    -- show the commands so that the errors are visible
    shell.RunInteractiveShell("echo 'There were some issues setting up. Running interactively to show errors...'", true, false)
    shell.RunInteractiveShell("echo 'The previous results were:'" .. results, true, false)
    shell.RunInteractiveShell("mkdir \"" .. config.ConfigDir .. "/colorschemes\"", true, false)
    shell.RunInteractiveShell("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-tc.micro " .. config.ConfigDir .. "/colorschemes/", true, false)
    shell.RunInteractiveShell("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-16.micro " .. config.ConfigDir .. "/colorschemes/", true, false)
    shell.RunInteractiveShell ("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-tc-light.micro " .. config.ConfigDir .. "/colorschemes/", true, false)
    shell.RunInteractiveShell("cp " .. config.ConfigDir .. "/plug/nordcolors/colorschemes/nord-16-light.micro " .. config.ConfigDir .. "/colorschemes/", true, false)
    shell.RunInteractiveShell("echo 'The files in the colorschemes directory now are:'", true, false)
    shell.RunInteractiveShell("ls " .. config.ConfigDir .. "/colorschemes", true, false)
    shell.RunInteractiveShell("echo 'If the four nord***.micro files are not there, you will have to move them manually.'", true, false)
  end
  
  config.Reload()
end
