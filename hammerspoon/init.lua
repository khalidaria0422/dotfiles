-- Toggle to the previously active app (no switcher UI)
local prevApp = nil
local curApp  = hs.application.frontmostApplication()

-- Track which app is frontmost so we always know "previous"
hs.application.watcher.new(function(name, event, app)
  if event == hs.application.watcher.activated then
    if app ~= curApp then
      prevApp = curApp
      curApp  = app
    end
  end
end):start()

-- Bind Alt+Escape to jump back to the previous app
hs.hotkey.bind({'alt'}, 'escape', function()
  if prevApp and prevApp:isRunning() then
    prevApp:activate(true)  -- true = bring across Spaces, no overlay
  else
    -- Fallback: if nothing tracked yet, behave like Cmd+Tab once
    hs.eventtap.keyStroke({'cmd'}, 'tab', 0)
  end
end)
