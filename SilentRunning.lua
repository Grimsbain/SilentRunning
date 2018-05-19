local addon, ns = ...

function SilentRunning_OnLoad(self)
	self:RegisterEvent("ADDON_LOADED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UPDATE_STEALTH")
end

local function ToggleMusic(IsStealthed)
	if ( not IsStealthed ) then
		SetCVar("Sound_EnableMusic", 1)
	else
		SetCVar("Sound_EnableMusic", 0)
	end
end

function SilentRunning_OnEvent(self, event, ...)
	if ( event == "ADDON_LOADED" ) then
		local name = ...

		if ( name == "SilentRunning" ) then
			if ( SilentRunningDB == nil ) then
				SilentRunningDB = { ["Switch"] = true, }
			end

			self:UnregisterEvent("ADDON_LOADED")
		end
	elseif ( event == "PLAYER_ENTERING_WORLD" or event == "UPDATE_STEALTH" ) then
		if ( not SilentRunningDB.Switch ) then return end
		ToggleMusic(IsStealthed())
	end
end
