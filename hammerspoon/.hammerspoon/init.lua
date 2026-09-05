local appMod = { "ctrl", "cmd" }

hs.hotkey.bind(appMod, "Left", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(appMod, "Up", function()
	hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind(appMod, "Down", function()
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(appMod, "Right", function()
	hs.application.launchOrFocus("Preview")
end)

hs.hotkey.bind(appMod, "b", function()
	hs.application.launchOrFocus("Books")
end)

hs.hotkey.bind(appMod, "o", function()
	hs.application.launchOrFocus("Microsoft Outlook")
end)

hs.hotkey.bind(appMod, "m", function()
	hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(appMod, "v", function()
	hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(appMod, "z", function()
	hs.application.launchOrFocus("Zotero")
end)
