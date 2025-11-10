hs.hotkey.bind({ "ctrl", "cmd" }, "Left", function()
	hs.application.launchOrFocus("Alacritty")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "Up", function()
	hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "Down", function()
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "Right", function()
	hs.application.launchOrFocus("Preview")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "z", function()
	hs.application.launchOrFocus("Zotero")
end)
