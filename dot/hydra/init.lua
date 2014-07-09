dofile(package.searchpath("win", package.path))
dofile(package.searchpath("up", package.path))

local mod = {"alt"}

-- Hot reload.
pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()

-- Menu.
menu.show(function()
  local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
  local updatefns = {[true] = updates.install, [false] = checkforupdates}
  local hasupdate = (updates.newversion ~= nil)

  return {
    {title = "Reload Config", fn = hydra.reload},
    {title = "-"},
    {title = "About", fn = hydra.showabout},
    {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
    {title = "Quit Hydra", fn = os.exit},
  }
end)

-- Window management.
hotkey.bind(mod, "H", win.left)
hotkey.bind(mod, "J", win.min)
hotkey.bind(mod, "K", win.max)
hotkey.bind(mod, "L", win.right)

-- Applications.
hotkey.bind(mod, "Q", function() application.launchorfocus("MacVim") end)
hotkey.bind(mod, "W", function() application.launchorfocus("Google Chrome") end)
hotkey.bind(mod, "E", function() application.launchorfocus("Finder") end)

-- Updates.
timer.new(timer.weeks(1), checkforupdates):start()
notify.register("showupdate", showupdate)

local lastcheckedupdates = settings.get('lastcheckedupdates')
if lastcheckedupdates == nil or lastcheckedupdates <= os.time() - timer.days(7) then
  checkforupdates()
end
