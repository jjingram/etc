function updates.available(available)
  if available then
    notify.show("Hydra update available", "", "Click here to see the changelog and maybe even install it", "showupdate")
  else
    notify.show("No update available.")
  end
end

function showupdate()
  os.execute('open https://github.com/sdegutis/Hydra/releases')
end

function checkforupdates()
  updates.check()
  settings.set('lastcheckedupdates', os.time())
end

