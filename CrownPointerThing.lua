CrownPointerThing = {}

CrownPointerThing.name = "Provinatus"

CrownPointerThing.reticle = ArrowReticle

-- From Exterminatus http://www.esoui.com/downloads/info329-0.1.html
local function NormalizeAngle(c)
  if c > math.pi then
    return c - 2 * math.pi
  end
  if c < -math.pi then
    return c + 2 * math.pi
  end
  return c
end

function CrownPointerThing:Initialize()
  CrownPointerThing.SavedVars = ZO_SavedVars:NewAccountWide("CrownPointerThingSavedVariables", 1, nil, ProvinatusConfig)
  ProvinatusCreateLAM2Panel()
  ProvinatusCompass:Initialize()
  EVENT_MANAGER:RegisterForEvent(
    CrownPointerThing.name,
    EVENT_PLAYER_ACTIVATED,
    CrownPointerThing.EVENT_PLAYER_ACTIVATED
  )
  EVENT_MANAGER:RegisterForEvent(
    CrownPointerThing.name,
    EVENT_START_SOUL_GEM_RESURRECTION,
    CrownPointerThing.EVENT_START_SOUL_GEM_RESURRECTION
  )
  EVENT_MANAGER:RegisterForEvent(
    CrownPointerThing.name,
    EVENT_END_SOUL_GEM_RESURRECTION,
    CrownPointerThing.EVENT_END_SOUL_GEM_RESURRECTION
  )
end

function CrownPointerThing.EVENT_PLAYER_ACTIVATED(eventCode, initial)
  CrownPointerThingIndicator:SetAnchor(CENTER, GuiRoot, CENTER, 0, 0)
  CrownPointerThing.reticle.Initialize()
end

function CrownPointerThing.onUpdate()
  if not CrownPointerThing.SavedVars then return end
  local PlayerX, PlayerY, PlayerHeading = GetMapPlayerPosition("player")
  local TargetX, TargetY, TargetHeading = GetMapPlayerPosition(GetGroupLeaderUnitTag())
  local Heading = GetPlayerCameraHeading()
  local CrownTargetOverride =
    CrownPointerThing.SavedVars.Debug and
    CrownPointerThing.SavedVars.DebugSettings.CrownPositionOverride

  if CrownTargetOverride then
    TargetX = CrownPointerThing.SavedVars.DebugSettings.TargetX
    TargetY = CrownPointerThing.SavedVars.DebugSettings.TargetY
  end

  local DistanceX = PlayerX - TargetX
  local DistanceY = PlayerY - TargetY
  local DistanceTarget = math.sqrt((DistanceX * DistanceX) + (DistanceY * DistanceY))

  -- 0 is straight, -PI/2 is left, PI/2 is right
  local Angle = NormalizeAngle(Heading - math.atan2(DistanceX, DistanceY))
  local Linear = Angle / math.pi
  local AbsoluteLinear = math.abs(Linear)

  if CrownTargetOverride then
    CrownPointerThing.SavedVars.DebugSettings.Reticle.AngleToTarget = Angle
  elseif CrownPointerThing.SavedVars and CrownPointerThing.SavedVars.Debug then
    Angle = CrownPointerThing.SavedVars.DebugSettings.Reticle.AngleToTarget
  end

  CrownPointerThing.reticle.UpdateTexture(DistanceTarget, DistanceX, DistanceY, Angle, Linear, AbsoluteLinear)
  ProvinatusHUD:UpdateHUD()
end

function CrownPointerThing.EVENT_ADD_ON_LOADED(event, addonName)
  if addonName == CrownPointerThing.name then
    CrownPointerThing:Initialize()
  end
end

function CrownPointerThing.EVENT_START_SOUL_GEM_RESURRECTION (eventCode, durationMs)
  CrownPointerThing.SoulGemResurrecting = true
end

function CrownPointerThing.EVENT_END_SOUL_GEM_RESURRECTION (eventCode)
  CrownPointerThing.SoulGemResurrecting = false
end

EVENT_MANAGER:RegisterForEvent(CrownPointerThing.name, EVENT_ADD_ON_LOADED, CrownPointerThing.EVENT_ADD_ON_LOADED)
