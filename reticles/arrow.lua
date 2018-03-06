ArrowReticle = {}
ArrowReticle.size = 50

local texture = "esoui/art/floatingmarkers/quest_icon_assisted.dds"
local Arrow
function ArrowReticle.Initialize()
  Arrow = Arrow or WINDOW_MANAGER:CreateControl("Arrow", CrownPointerThingIndicator, CT_TEXTURE)
  Arrow:SetDimensions(ArrowReticle.size, ArrowReticle.size)
  Arrow:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, ArrowReticle.size / 2)
  Arrow:SetTexture(texture)
  Arrow:SetAlpha(1)
end

function ArrowReticle.UpdateTexture(DistanceToTarget, DX, DY, AngleToTarget, Linear, AbsoluteLinear)
  if not Arrow then
    return
  elseif IsUnitSoloOrGroupLeader("player") or ZO_ReticleContainer:IsHidden() then
    Arrow:SetAlpha(0)
    return
  end
  local AbsAngleToTarget = math.abs(AngleToTarget)
  local R = AbsAngleToTarget / 2
  local G = math.pi - AbsAngleToTarget
  local B = 0
  Arrow:SetTextureRotation(math.pi - AngleToTarget)
  Arrow:SetColor(R, G, B)
end
