local addon, ns = ...

local Options = CreateFrame("Frame", "SilentOptions", InterfaceOptionsFramePanelContainer)
Options.name = GetAddOnMetadata(addon, "Title")
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
	SubText:SetText(GetAddOnMetadata(addon, "Notes"))

	local Switch = CreateFrame("CheckButton", "$parentSwitch", Options, "InterfaceOptionsCheckButtonTemplate")
	Switch:SetPoint("TOPLEFT", SubText, "BOTTOMLEFT", 0, -12)
	Switch.Text:SetText(ENABLE)
	Switch:SetScript("OnClick", function(self)
		local checked = not not self:GetChecked()
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		SilentRunningDB.Switch = checked
	end)

	function Options:Refresh()
		Switch:SetChecked(SilentRunningDB.Switch)
	end

	Options:Refresh()
	Options:SetScript("OnShow", nil)
end)
