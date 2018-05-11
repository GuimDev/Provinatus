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
      local DX = MyX - X
      local DY = MyY - Y

      local Log2X = math.log(math.abs(DX) * 2, 2)
      local Log2Y = math.log(math.abs(DY) * 2, 2)

      if DX < 0 then 
        DX = -Log2X
      else
        DX = Log2X
      end

      if DY < 0 then
        DY = -Log2Y
      else
        DY = Log2Y
      end

      -- local Distance = math.sqrt((DX * DX) + (DY * DY))
      d(DX, DY, "*")
      self.Players[DisplayName].Icon:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, DX, DY)
    end
  end
end

-- EVENT_GROUP_MEMBER_JOINED
-- EVENT_LEADER_UPDATE
-- EVENT_GROUP_MEMBER_CONNECTED_STATUS
-- EVENT_GROUP_MEMBER_IN_REMOTE_REGION
