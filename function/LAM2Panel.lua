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
	CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride = ProvinatusConfig.DebugSettings.CrownPositionOverride
	CrownPointerThing.SavedVars.DebugSettings.TargetX = ProvinatusConfig.DebugSettings.TargetX
	CrownPointerThing.SavedVars.DebugSettings.TargetY = ProvinatusConfig.DebugSettings.TargetY
end

local function SetDebug(value)
	CrownPointerThing.SavedVars.Debug = value
	if CrownPointerThing.SavedVars.Debug then
		d("Enabled Provinatus debug")
	else
		d("Disabled Provinatus debug")
	end
end

function ProvinatusCreateLAM2Panel()
	local panelData = {
		type = "panel",
		name = "Provinatus",
		displayName = "Provinatus (color)",
		author = "Provinatus & Albino Python",
		slashCommand = "/provinatus",
		version = "{{**DEVELOPMENTVERSION**}}",
		registerForRefresh = true,
		registerForDefaults = true,
		resetFunc = function()
			ResetCrownPointer()
		end
	}

	local optionsData = {
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
					type = "divider",
					width = "full", --or "half" (optional)
					height = 10,
					alpha = 0.25
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
					width = "full",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug or
							CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride
					end
				},
				{
					type = "divider",
					width = "full", --or "half" (optional)
					height = 10,
					alpha = 0.25
				},
				{
					-- TODO strings file
					type = "checkbox",
					name = "Set Crown Position",
					tooltip = "Overrides 'Crown Pointer direction' setting",
					getFunc = function()
						return CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride = value
					end,
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug
					end,
					width = "half"
				},
				{
					type = "button",
					name = "Snap to me", -- string id or function returning a string
					func = function()
						local PlayerX, PlayerY, PlayerHeading = GetMapPlayerPosition("player")
						CrownPointerThing.SavedVars.DebugSettings.TargetX = PlayerX
						CrownPointerThing.SavedVars.DebugSettings.TargetY = PlayerY
					end,
					tooltip = "Set Crown Pointer to your current location", -- string id or function returning a string (optional)
					width = "half", --or "half" (optional)
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug or
							not CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride
					end --or boolean (optional)
				},
				{
					type = "slider",
					name = "Set Crown X",
					min = tonumber(string.format("%." .. (2 or 0) .. "f", 0)),
					max = tonumber(string.format("%." .. (2 or 0) .. "f", 1)),
					step = 1 / 100,
					getFunc = function()
						return tonumber(string.format("%." .. (2 or 0) .. "f", CrownPointerThing.SavedVars.DebugSettings.TargetX))
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.DebugSettings.TargetX = value
					end,
					width = "half",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug or
							not CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride
					end
				},
				{
					type = "slider",
					name = "Set Crown Y",
					min = tonumber(string.format("%." .. (2 or 0) .. "f", 0)),
					max = tonumber(string.format("%." .. (2 or 0) .. "f", 1)),
					step = 1 / 100,
					getFunc = function()
						return tonumber(string.format("%." .. (2 or 0) .. "f", CrownPointerThing.SavedVars.DebugSettings.TargetY))
					end,
					setFunc = function(value)
						CrownPointerThing.SavedVars.DebugSettings.TargetY = value
					end,
					width = "half",
					disabled = function()
						return not CrownPointerThing.SavedVars.CrownPointer.Enabled or not CrownPointerThing.SavedVars.Debug or
							not CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride
					end
				}
			}
		}
	}

	-- TODO save reference to panel so we can get to it from a slash command elsewhere.
	local LAM2 = LibStub:GetLibrary("LibAddonMenu-2.0")
	LAM2:RegisterAddonPanel("Provinatus" .. "LAM2Panel", panelData)
	LAM2:RegisterOptionControls("Provinatus" .. "LAM2Panel", optionsData)
end
