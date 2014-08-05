win = {}

function win.max()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  win:maximize()
  win:setframe(newframe)
end
