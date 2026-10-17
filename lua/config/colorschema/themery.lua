local themery, status_ok = require("themery")
if not status_ok then
  return
end

themery.setup({
    themes = {"gruvbox", "kanagawa"},
    livePreview = true,
})
