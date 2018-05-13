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
    if IsOnline and self.Players[UnitTag] == nil and UnitName ~= MyName then
      self.Players[UnitTag] = {}
      self.Players[UnitTag].Icon = WINDOW_MANAGER:CreateControl(nil, CrownPointerThingIndicator, CT_TEXTURE)
      self.Players[UnitTag].Icon:SetDimensions(24, 24)
      self.Players[UnitTag].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, 0)
      self.Players[UnitTag].Icon:SetTexture("/esoui/art/icons/mapkey/mapkey_groupmember.dds")
      self.Players[UnitTag].Icon:SetDrawLevel(3)
    end
  end
end

function ProvinatusHUD:UpdateHUD()
  if not CrownPointerThing or not CrownPointerThing.SavedVars then return end
  for i = 1, GetGroupSize() do
    local UnitTag = "group" .. i
    -- local IsLeader = IsUnitGroupLeader(UnitTag)
    if IsUnitOnline(UnitTag) and self.Players[UnitTag] ~= nil and GetUnitName(UnitTag) ~= GetUnitName("player") then
      local X, Y, Heading = GetMapPlayerPosition(UnitTag)
      local MyX, MyY, MyHeading = GetMapPlayerPosition("player")
      -- Horizontal distance to target
      local DistanceX = MyX - X
      -- Vertical distance to target
      local DistanceY = MyY - Y
      -- Angle to target. ¯\_(ツ)_/¯
      local Phi = -1 * GetPlayerCameraHeading() - math.atan2(DistanceY, DistanceX)
      -- The closer the target the more exaggerated the movement becomes.  
      local DistanceProjected = math.atan(math.sqrt((DistanceX * DistanceX) + (DistanceY * DistanceY)) * 500) * (CrownPointerThing.SavedVars.HUD.Size / 2)
      -- Calculates where to draw on the screen.
      local XProjected = DistanceProjected * math.cos(Phi)
      local YProjected = DistanceProjected * math.sin(Phi)
      -- Need to flip the x axis.
      self.Players[UnitTag].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, -XProjected, YProjected)
    elseif self.Players[UnitTag] ~= nil and not IsUnitOnline(UnitTag) then
      self.Players[UnitTag].Icon:SetAlpha(0)
    end
  end
end

-- EVENT_GROUP_MEMBER_JOINED
-- EVENT_LEADER_UPDATE
-- EVENT_GROUP_MEMBER_CONNECTED_STATUS
-- EVENT_GROUP_MEMBER_IN_REMOTE_REGION
