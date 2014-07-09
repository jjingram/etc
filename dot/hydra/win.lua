win = {}

function win.right()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  win:setframe(newframe)
end

function win.left()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  win:setframe(newframe)
end

function win.max()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  win:maximize()
  win:setframe(newframe)
end

function win.min()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  win:minimize()
  win:setframe(newframe)
end
