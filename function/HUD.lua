ProvinatusHUD = {
  Players = {}
}

function ProvinatusHUD:Initialize()
  for i = 1, GetGroupSize() do
    UnitTag = "group" .. i
    UnitName = GetUnitName(UnitTag)
    MyName = GetUnitName("player")
    IsLeader = IsUnitGroupLeader(UnitTag)
    IsOnline = IsUnitOnline(UnitTag)

    -- TODO should index by unittag?
    if IsOnline and self.Players[i] == nil and UnitName ~= MyName then
      self.Players[i] = {}
      self.Players[i].Icon = WINDOW_MANAGER:CreateControl(nil, CrownPointerThingIndicator, CT_TEXTURE)
      self.Players[i].Icon:SetDimensions(24, 24)
      self.Players[i].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, 0)
      self.Players[i].Icon:SetTexture("/esoui/art/icons/mapkey/mapkey_groupmember.dds")
      self.Players[i].Icon:SetDrawLevel(3)
    end
  end
end

local ClassMapping = {
  [1] = "Dragonknight",
  [2] = "Sorcerer",
  [3] = "Nightblade",
  [4] = "Warden",
  [6] = "Templar"
}

local function GetIconTexture(UnitTag)
  local Texture
  if IsUnitGroupLeader(UnitTag) then
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
    Texture = "esoui/art/contacts/social_classicon_" .. Class .. ".dds"
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

function ProvinatusHUD:UpdateHUD()
  if not CrownPointerThing or not CrownPointerThing.SavedVars then
    return
  end
  for i = 1, GetGroupSize() do
    local UnitTag = "group" .. i
    -- local IsLeader = IsUnitGroupLeader(UnitTag)
    if IsUnitOnline(UnitTag) and self.Players[i] ~= nil and GetUnitName(UnitTag) ~= GetUnitName("player") then
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
    end
  end
end

-- EVENT_GROUP_MEMBER_JOINED
-- EVENT_LEADER_UPDATE
-- EVENT_GROUP_MEMBER_CONNECTED_STATUS
-- EVENT_GROUP_MEMBER_IN_REMOTE_REGION
