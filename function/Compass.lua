ProvinatusCompass = {
  CardinalPoints = {}
}

function ProvinatusCompass:Initialize()
  for i = 1, 4 do
    self.CardinalPoints[i] = WINDOW_MANAGER:CreateControl(nil, CrownPointerThingIndicator, CT_LABEL)
    self.CardinalPoints[i]:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, 0)
    self.CardinalPoints[i]:SetFont("ZoFontHeader4")
    self.CardinalPoints[i]:SetDrawLevel(0)
    self.CardinalPoints[i]:SetAlpha(CrownPointerThing.SavedVars.HUD.Compass.Alpha)
  end

  self.CardinalPoints[1]:SetText(GetString(SI_COMPASS_NORTH_ABBREVIATION))
  self.CardinalPoints[2]:SetText(GetString(SI_COMPASS_EAST_ABBREVIATION))
  self.CardinalPoints[3]:SetText(GetString(SI_COMPASS_SOUTH_ABBREVIATION))
  self.CardinalPoints[4]:SetText(GetString(SI_COMPASS_WEST_ABBREVIATION))
end

function ProvinatusCompass:UpdateCompass()
  for i = 1, 4 do
    local heading = (i - 2) * math.pi / 2 + GetPlayerCameraHeading()
    local CardinalDirectionX = zo_round(CrownPointerThing.SavedVars.HUD.Size * math.cos(heading))
    local CardinalDirectionY = zo_round(CrownPointerThing.SavedVars.HUD.Size * math.sin(heading))
    CardinalDirectionY = CardinalDirectionY
    self.CardinalPoints[i]:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, CardinalDirectionX, CardinalDirectionY)
    self.CardinalPoints[i]:SetAlpha(CrownPointerThing.SavedVars.HUD.Compass.Alpha)
  end
end
