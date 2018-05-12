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
    DisplayName = GetUnitDisplayName(UnitTag)

    -- TODO should index by unittag?
    if IsOnline and self.Players[DisplayName] == nil and UnitName ~= MyName then
      self.Players[DisplayName] = {}
      self.Players[DisplayName].Icon = WINDOW_MANAGER:CreateControl(nil, CrownPointerThingIndicator, CT_TEXTURE)
      self.Players[DisplayName].Icon:SetDimensions(40, 40)
      self.Players[DisplayName].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, 0)
      self.Players[DisplayName].Icon:SetTexture("/esoui/art/icons/mapkey/mapkey_groupmember.dds")
      self.Players[DisplayName].Icon:SetDrawLevel(3)
    end
  end
end

function ProvinatusHUD:UpdateHUD()
  for i = 1, GetGroupSize() do
    local UnitTag = "group" .. i
    local UnitName = GetUnitName(UnitTag)
    local MyName = GetUnitName("player")
    local IsLeader = IsUnitGroupLeader(UnitTag)
    local IsOnline = IsUnitOnline(UnitTag)
    local DisplayName = GetUnitDisplayName(UnitTag)
    if IsOnline and self.Players[DisplayName] ~= nil and UnitName ~= MyName then
      local X, Y, Heading = GetMapPlayerPosition(UnitTag)
      local MyX, MyY, MyHeading = GetMapPlayerPosition("player")
      local DistanceX = MyX - X
      local DistanceY = MyY - Y
      local DistanceTarget = math.sqrt((DistanceX * DistanceX) + (DistanceY * DistanceY))
      local ProjectedRadius = math.atan(DistanceTarget) * 10000
      local Angle = GetPlayerCameraHeading() - math.atan2(DistanceY, DistanceX) - math.pi / 2
      d(math.atan2(DistanceY, DistanceX))
      local IconX = ProjectedRadius * math.cos(Angle)
      local IconY = ProjectedRadius * math.sin(Angle)

      -- local Distance = math.sqrt((DX * DX) + (DY * DY))
      self.Players[DisplayName].Icon:SetAnchor(
        CENTER,
        CrownPointerThingIndicator,
        CENTER,
        -IconX,
        -IconY + CrownPointerThing.SavedVars.CrownPointer.Size / 2
      )
    end
  end
end

-- EVENT_GROUP_MEMBER_JOINED
-- EVENT_LEADER_UPDATE
-- EVENT_GROUP_MEMBER_CONNECTED_STATUS
-- EVENT_GROUP_MEMBER_IN_REMOTE_REGION
