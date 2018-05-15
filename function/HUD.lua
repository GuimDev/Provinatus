ProvinatusHUD = {
  Players = {}
}

local ClassMapping = {
  [1] = "Dragonknight",
  [2] = "Sorcerer",
  [3] = "Nightblade",
  [4] = "Warden",
  [6] = "Templar"
}

-- Returns true if the unit is reincarnating, is being resurrected,
-- or has a resurrection pending.
local function UnitHasBeenTendedTo(UnitTag)
  return IsUnitReincarnating(UnitTag) or IsUnitBeingResurrected(UnitTag) or DoesUnitHaveResurrectPending(UnitTag)
end

local function GetIconTexture(UnitTag)
  local Texture
  if UnitHasBeenTendedTo(UnitTag) then
    Texture = CrownPointerThing.SavedVars.PlayerIcons.ResurrectionPending
  elseif IsUnitDead(UnitTag) then
    Texture = CrownPointerThing.SavedVars.PlayerIcons.Dead
  elseif IsUnitGroupLeader(UnitTag) then
    Texture = CrownPointerThing.SavedVars.PlayerIcons.Crown.Alive
  elseif CrownPointerThing.SavedVars.HUD.ShowRoleIcons then
    local IsDps, IsHealer, IsTank = GetGroupMemberRoles(UnitTag)
    local Role = "dps"
    if IsTank then
      Role = "tank"
    elseif IsHealer then
      Role = "healer"
    end
    Texture = "/esoui/art/lfg/lfg_" .. Role .. "_up.dds"
  else
    local Class = ClassMapping[GetUnitClassId(UnitTag)]
    if Class == nil then
      Texture = "/esoui/art/icons/mapkey/mapkey_groupmember.dds"
    else
      Texture = "esoui/art/contacts/social_classicon_" .. Class .. ".dds"
    end
  end
  return Texture
end

local function GetIconAlpha(UnitTag)
  local Apha
  if not IsUnitOnline(UnitTag) then
    Alpha = 0
  elseif IsUnitGroupLeader(UnitTag) then
    Alpha = CrownPointerThing.SavedVars.HUD.TargetIconAlpha
  else
    Alpha = CrownPointerThing.SavedVars.HUD.PlayerIconAlpha
  end
  return Alpha
end

local function GetIconDimensions(UnitTag)
  if IsUnitGroupLeader(UnitTag) then
    return CrownPointerThing.SavedVars.HUD.TargetIconSize, CrownPointerThing.SavedVars.HUD.TargetIconSize
  else
    return CrownPointerThing.SavedVars.HUD.PlayerIconSize, CrownPointerThing.SavedVars.HUD.PlayerIconSize
  end
end

local function GetIconColor(UnitTag)
  local R, G, B = 1, 1, 1
  if IsUnitDead(UnitTag) then
    if not UnitHasBeenTendedTo(UnitTag) then
      G = 0
      B = 0
    end
  else
    local health, maxHealth, effectiveMaxHealth = GetUnitPower(UnitTag, POWERTYPE_HEALTH)
    local ratio = health / maxHealth
    G = ratio
    B = ratio
  end
  return R, G, B
end

function ProvinatusHUD:UpdateHUD()
  if not CrownPointerThing or not CrownPointerThing.SavedVars then
    return
  end

  ProvinatusCompass:UpdateCompass()
  for i = 1, GetGroupSize() do
    local UnitTag = "group" .. i
    if IsUnitOnline(UnitTag) and GetUnitName(UnitTag) ~= GetUnitName("player") then
      if self.Players[i] == nil then
        self.Players[i] = {}
        self.Players[i].Icon = WINDOW_MANAGER:CreateControl(nil, CrownPointerThingIndicator, CT_TEXTURE)
      end
      if
        (not CrownPointerThing.SavedVars.HUD.Enabled or ZO_ReticleContainer:IsHidden()) and
          not CrownPointerThing.SoulGemResurrecting and
          self.Players[i] ~= nil and
          self.Players[i].Icon ~= nil
       then
        self.Players[i].Icon:SetAlpha(0)
        break
      end
      local X, Y, Heading = GetMapPlayerPosition(UnitTag)
      local MyX, MyY, MyHeading = GetMapPlayerPosition("player")
      -- Horizontal distance to target
      local DistanceX = MyX - X
      -- Vertical distance to target
      local DistanceY = MyY - Y
      -- Angle to target. ¯\_(ツ)_/¯
      local Phi = -1 * GetPlayerCameraHeading() - math.atan2(DistanceY, DistanceX)
      -- The closer the target the more exaggerated the movement becomes.
      local DistanceProjected =
        math.atan(math.sqrt((DistanceX * DistanceX) + (DistanceY * DistanceY)) * 500) *
        (CrownPointerThing.SavedVars.HUD.Size / 2)
      -- Calculates where to draw on the screen.
      local XProjected = DistanceProjected * math.cos(Phi)
      local YProjected = DistanceProjected * math.sin(Phi)
      -- Need to flip the x axis.
      self.Players[i].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, -XProjected, YProjected)
      self.Players[i].Icon:SetTexture(GetIconTexture(UnitTag))
      self.Players[i].Icon:SetAlpha(GetIconAlpha(UnitTag))
      self.Players[i].Icon:SetDimensions(GetIconDimensions(UnitTag))
      self.Players[i].Icon:SetColor(GetIconColor(UnitTag))
    end
  end

  for i = GetGroupSize() + 1, #self.Players do
    if self.Players[i] ~= nil and self.Players[i].Icon ~= nil then
      self.Players[i].Icon:SetAlpha(0)
    end
  end
end
