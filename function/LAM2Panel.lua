local function colorizePseudo(rgb, pseudo)
	local color = ZO_ColorDef:New(unpack(rgb))
	return "|c" .. color:ToHex() .. "|t24:24:EsoUI/Art/Miscellaneous/Gamepad/gp_charNameIcon.dds:inheritcolor|t " .. pseudo
end

local function TeamFormation_mapChoices(func, array)
	local new_array = {}

	if not array then
		return array
	end

	for k, v in pairs(array) do
		table.insert(new_array, func(v, k))
	end

	return new_array
end

local function TeamFormation_mapJRULES()
	return TeamFormation_mapChoices(colorizePseudo, ProvTF.vars.jRules)
end

local function ResetCrownPointer()
	CrownPointerThing.SavedVars.CrownPointer.Enabled = ProvinatusConfig.CrownPointer.Enabled
	CrownPointerThing.SavedVars.CrownPointer.Alpha = ProvinatusConfig.CrownPointer.Alpha
	CrownPointerThing.SavedVars.CrownPointer.Size = ProvinatusConfig.CrownPointer.Size
	CrownPointerThing.SavedVars.Debug = ProvinatusConfig.Debug
	CrownPointerThing.SavedVars.DebugSettings.Reticle.AngleToTarget = ProvinatusConfig.DebugSettings.Reticle.AngleToTarget
	CrownPointerThing.SavedVars.PlayerIconSettings.CrownAlpha = ProvinatusConfig.PlayerIconSettings.CrownAlpha
	CrownPointerThing.SavedVars.PlayerIconSettings.CrownDeadAlpha = ProvinatusConfig.PlayerIconSettings.CrownDeadAlpha
	CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownAlpha = ProvinatusConfig.PlayerIconSettings.NonCrownAlpha
	CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownDeadAlpha =
		ProvinatusConfig.PlayerIconSettings.NonCrownDeadAlpha
end

local function SetDebug(value)
	CrownPointerThing.SavedVars.Debug = value
	if CrownPointerThing.SavedVars.Debug then
		d("Enabled Provinatus debug")
	else
		d("Disabled Provinatus debug")
	end
end

function TeamFormation_createLAM2Panel()
	local panelData = {
		type = "panel",
		name = "Provinatus",
		displayName = "Provinatus (color)",
		author = "Provinatus & Albino Python",
		slashCommand = "/provinatus",
		version = "{{**DEVELOPMENTVERSION**}}",
		registerForRefresh = true,
		registerForDefaults = true
		-- resetFunc = function()
		-- 	ProvTF.vars = nil
		-- 	ProvTF.vars = ProvTF.defaults
		-- 	ProvTF.vars.jRules = nil
		-- 	ProvTF.vars.jRules = {}

		-- 	ProvTF.UI:SetAnchor(CENTER, GuiRoot, CENTER, ProvTF.vars.posx, ProvTF.vars.posy)
		-- 	TeamFormation_SetHidden(not ProvTF.vars.enabled)

		-- 	TeamFormation_ResetRefreshRate()
		-- 	ResetCrownPointer()
		-- end
	}

	local optionsData = {
		{
			type = "submenu",
			name = "Player Icon Settings",
			controls = {
				{
					type = "description",
					text = GetString(LEADER_ICON_SETTINGS)
				},
				{
					type = "slider",
					name = GetString(LEADER_ICON_OPACITY),
					tooltip = GetString(LEADER_ICON_OPACITY_TOOLTIP),
					min = 0,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.PlayerIconSettings.CrownAlpha * 100
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.PlayerIconSettings.CrownAlpha = value / 100
					end,
					width = "half"
				},
				{
					type = "slider",
					name = GetString(LEADER_DEAD_ICON_OPACITY),
					tooltip = GetString(LEADER_DEAD_ICON_OPACITY_TOOLTIP),
					min = 0,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.PlayerIconSettings.CrownDeadAlpha * 100
					end,
					setFunc = function(value)
						d(CrownPointerThing.SavedVars.PlayerIconSettings.CrownDeadAlpha)
						CrownPointerThing.SavedVars.PlayerIconSettings.CrownDeadAlpha = value / 100
					end,
					width = "half"
				},
				{
					type = "description",
					text = GetString(TEAMMATE_ICON_SETTINGS)
				},
				{
					type = "slider",
					name = GetString(NON_LEADER_ICON_OPACITY),
					tooltip = GetString(NON_LEADER_ICON_OPACITY_TOOLTIP),
					min = 0,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownAlpha * 100
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownAlpha = value / 100
					end,
					width = "half"
				},
				{
					type = "slider",
					name = GetString(DEAD_PLAYER_OPACITY),
					tooltip = GetString(DEAD_PLAYER_OPACITY_TOOLTIP),
					min = 0,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownDeadAlpha * 100
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.PlayerIconSettings.NonCrownDeadAlpha = value / 100
					end,
					width = "half"
				}
			}
		},
		{
			type = "submenu",
			name = GetString(CROWN_POINTER_THING),
			controls = {
				{
					type = "checkbox",
					name = GetString(CROWN_POINTER_ENABLE),
					tooltip = GetString(CROWN_POINTER_ENABLE_TOOLTIP),
					getFunc = function()
						return CrownPointerThing.SavedVars.CrownPointer.Enabled
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.CrownPointer.Enabled = value
					end,
					width = "full"
				},
				{
					type = "slider",
					name = GetString(CROWN_POINTER_OPACITY),
					tooltip = GetString(CROWN_POINTER_OPACITY_TOOLTIP),
					min = 0,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.CrownPointer.Alpha * 100
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.CrownPointer.Alpha = value / 100
					end,
					width = "half",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled
					end
				},
				{
					type = "slider",
					name = GetString(CROWN_POINTER_SIZE),
					tooltip = GetString(CROWN_POINTER_SIZE_TOOLTIP),
					min = 20,
					max = 100,
					step = 1,
					getFunc = function()
						return CrownPointerThing.SavedVars.CrownPointer.Size
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.CrownPointer.Size = value
					end,
					width = "half",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled
					end
				},
				{
					type = "description",
					text = GetString(CROWN_POINTER_DEBUG_SETTINGS)
				},
				{
					type = "checkbox",
					name = GetString(CROWN_POINTER_ENABLE_DEBUG),
					tooltip = GetString(CROWN_POINTER_ENABLE_DEBUG_TOOLTIP),
					getFunc = function()
						return CrownPointerThing.SavedVars.Debug
					end,
					setFunc = function(value)
						SetDebug(value)
					end,
					width = "full",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled
					end
				},
				{
					type = "slider",
					name = GetString(CROWN_POINTER_DIRECTION),
					tooltip = GetString(CROWN_POINTER_DIRECTION_TOOLTIP),
					min = tonumber(string.format("%." .. (2 or 0) .. "f", -math.pi)),
					max = tonumber(string.format("%." .. (2 or 0) .. "f", math.pi)),
					step = math.pi / 16,
					getFunc = function()
						return tonumber(
							string.format("%." .. (2 or 0) .. "f", CrownPointerThing.SavedVars.DebugSettings.Reticle.AngleToTarget)
						)
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.DebugSettings.Reticle.AngleToTarget = value
					end,
					width = "half",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug
					end
				}
			}
		}
	}

	SLASH_COMMANDS["/tfrainbow"] = function()
		local r, g, b, pseudo
		for i = 1, 24 do
			pseudo = GetUnitName("group" .. i)
			if pseudo ~= "" then
				r, g, b = HSV2RGB(0.1 * ((i - 1) % 10), 0.5, 1.0)
				ProvTF.vars.jRules[pseudo] = {r, g, b}
				d(colorizePseudo({r, g, b}, pseudo))
			end
		end

		local ctrl_dropdown = WINDOW_MANAGER:GetControlByName("ProvTF#jRulesList")
		if ctrl_dropdown then
			ctrl_dropdown:UpdateChoices(TeamFormation_mapJRULES())
		end
	end

	-- TODO save reference to panel so we can get to it from a slash command elsewhere.
	LAM2:RegisterAddonPanel("Provinatus" .. "LAM2Panel", panelData)
	LAM2:RegisterOptionControls("Provinatus" .. "LAM2Panel", optionsData)
end
