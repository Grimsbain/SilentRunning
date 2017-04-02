-- Settings
if SilentRunningDB == nil then
	SilentRunningDB = { ["Switch"] = true, }
end

-- Toggle Music on and off.
local function ToggleMusic(toggle)
	if toggle then
		SetCVar("Sound_EnableMusic", 1);
	else
		SetCVar("Sound_EnableMusic", 0);
	end
end

-- Either silents or restores sounds depending on if you are in stealth.
local function onEvent(self, event)
		if not SilentRunningDB.Switch then return end
		-- Checks for Stealth
		stealthed = IsStealthed();

		if (stealthed) then
			ToggleMusic(false)
		else
			ToggleMusic(true)
		end
end

-- Gets the addon going on startup and rechecks on stealth status change.
local addon = CreateFrame('Frame')
addon:SetScript('OnEvent', onEvent)
addon:RegisterEvent('ADDON_LOADED')
addon:RegisterEvent('UPDATE_STEALTH')
