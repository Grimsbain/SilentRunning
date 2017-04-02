if SilentRunningDB == nil then
	SilentRunningDB = { ["Switch"] = true, }
end

local function ToggleMusic(toggle)
	if toggle then
		SetCVar("Sound_EnableMusic", 1);
	else
		SetCVar("Sound_EnableMusic", 0);
	end
end

local function onEvent(self, event)
		if not SilentRunningDB.Switch then return end
		stealthed = IsStealthed();
		if (stealthed) then
			ToggleMusic(false)
		else
			ToggleMusic(true)
		end
end

local addon = CreateFrame('Frame')
addon:SetScript('OnEvent', onEvent)
addon:RegisterEvent('ADDON_LOADED')
addon:RegisterEvent('UPDATE_STEALTH')
