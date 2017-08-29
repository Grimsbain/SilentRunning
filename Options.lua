local ADDON, ns = ...

local checkboxOn = PlaySoundKitID and "igMainMenuOptionCheckBoxOn" or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
local checkboxOff = PlaySoundKitID and "igMainMenuOptionCheckBoxOff" or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF

local Options = CreateFrame("Frame", "SilentOptions", InterfaceOptionsFramePanelContainer)
Options.name = GetAddOnMetadata(ADDON, "Title")
InterfaceOptions_AddCategory(Options)

Options:Hide()
Options:SetScript("OnShow", function()
	local Title = Options:CreateFontString("$parentTitle", "ARTWORK", "GameFontNormalLarge")
	Title:SetPoint("TOPLEFT", 16, -16)
	Title:SetText(Options.name)

	local SubText = Options:CreateFontString("$parentSubText", "ARTWORK", "GameFontHighlightSmall")
	SubText:SetPoint("TOPLEFT", Title, "BOTTOMLEFT", 0, -8)
	SubText:SetPoint("RIGHT", -32, 0)
	SubText:SetHeight(32)
	SubText:SetJustifyH("LEFT")
	SubText:SetJustifyV("TOP")
	SubText:SetText(GetAddOnMetadata(ADDON, "Notes"))

	local Switch = CreateFrame("CheckButton", "$parentSwitch", Options, "InterfaceOptionsCheckButtonTemplate")
	Switch:SetPoint("TOPLEFT", SubText, "BOTTOMLEFT", 0, -12)
	Switch.Text:SetText("Enable")
	Switch.tooltipText = "Switch addon on or off."
	Switch:SetScript("OnClick", function(this)
		local checked = not not this:GetChecked()
		PlaySound(checked and checkboxOn or checkboxOff)
		SilentRunningDB.Switch = checked
	end)

	function Options:Refresh()
		Switch:SetChecked(SilentRunningDB.Switch)
	end

	Options:Refresh()
	Options:SetScript("OnShow", nil)
end)
