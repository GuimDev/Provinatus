ArrowReticle = {}

local Arrow
function ArrowReticle.Initialize()
  Arrow = Arrow or WINDOW_MANAGER:CreateControl("Arrow", CrownPointerThingIndicator, CT_TEXTURE)
  Arrow:SetAnchor(CENTER, CrownPointerThingIndicator, CENTER, 0, 0)
  Arrow:SetTexture(CrownPointerThing.SavedVars.CrownPointer.Texture)
end

function ArrowReticle.SetHidden(ShouldHide)
  if ShouldHide and not Arrow:IsHidden() then
    Arrow:SetHidden(ShouldHide)
  elseif CrownPointerThing.SavedVars.CrownPointer.Enabled then
    Arrow:SetHidden(ShouldHide)
  end
end

function ArrowReticle.UpdateTexture(DistanceToTarget, DX, DY, AngleToTarget, Linear, AbsoluteLinear)
  if not Arrow then
    return
  end

  if not CrownPointerThing.SavedVars.CrownPointer.Enabled then
    Arrow:SetHidden(true)
    return
  end

  if IsUnitSoloOrGroupLeader("player") or IsActiveWorldBattleground() then
    Arrow:SetAlpha(0)
    if not CrownPointerThing.SavedVars.Debug then
      return
    end
  end

  -- Why didn't I write a comment here?
  local AbsAngleToTarget = math.abs(AngleToTarget)
  local R = AbsAngleToTarget / 2
  local G = math.pi - AbsAngleToTarget
  local B = 0
  Arrow:SetTextureRotation(math.pi - AngleToTarget)
  Arrow:SetColor(R, G, B)
  Arrow:SetAlpha(CrownPointerThing.SavedVars.CrownPointer.Alpha)
  Arrow:SetDimensions(CrownPointerThing.SavedVars.CrownPointer.Size, CrownPointerThing.SavedVars.CrownPointer.Size)
end
