local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

local mod = {"alt"}

-- Window management.
hotkey.bind(mod, "F", function()
    window.focusedwindow():maximize()
end)

-- Applications.
hotkey.bind(mod, "Q", function() application.launchorfocus("iTerm") end)
hotkey.bind(mod, "W", function() application.launchorfocus("Google Chrome") end)
hotkey.bind(mod, "E", function() application.launchorfocus("Finder") end)
hotkey.bind(mod, "R", function() application.launchorfocus("Preview") end)
