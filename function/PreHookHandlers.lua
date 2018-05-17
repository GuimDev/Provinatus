PreHookHandlers = {}

function PreHookHandlers:Initialize()
  ZO_PreHookHandler(
    ZO_GameMenu_InGame,
    "OnShow",
    function()
      d("ZO_GameMenu_InGame - OnShow")
      CrownPointerThing.reticle.SetHidden(true)
      ProvinatusCompass:SetHidden(true)
      ProvinatusHUD:SetHidden(true)
    end
  )
  ZO_PreHookHandler(
    ZO_GameMenu_InGame,
    "OnHide",
    function()
      d("ZO_GameMenu_InGame - OnHide")
      CrownPointerThing.reticle.SetHidden(false)
      ProvinatusCompass:SetHidden(false)
      ProvinatusHUD:SetHidden(false)
    end
  )
  ZO_PreHookHandler(
    ZO_InteractWindow,
    "OnShow",
    function()
      d("ZO_InteractWindow - OnShow")
      CrownPointerThing.reticle.SetHidden(true)
      ProvinatusCompass:SetHidden(true)
      ProvinatusHUD:SetHidden(true)
    end
  )
  ZO_PreHookHandler(
    ZO_InteractWindow,
    "OnHide",
    function()
      d("ZO_InteractWindow - OnHide")
      CrownPointerThing.reticle.SetHidden(false)
      ProvinatusCompass:SetHidden(false)
      ProvinatusHUD:SetHidden(false)
    end
  )
  ZO_PreHookHandler(
    ZO_KeybindStripControl,
    "OnShow",
    function()
      d("ZO_KeybindStripControl - OnShow")
      CrownPointerThing.reticle.SetHidden(true)
      ProvinatusCompass:SetHidden(true)
      ProvinatusHUD:SetHidden(true)
    end
  )
  ZO_PreHookHandler(
    ZO_KeybindStripControl,
    "OnHide",
    function()
      d("ZO_KeybindStripControl - OnHide")
      CrownPointerThing.reticle.SetHidden(false)
      ProvinatusCompass:SetHidden(false)
      ProvinatusHUD:SetHidden(false)
    end
  )
  ZO_PreHookHandler(
    ZO_MainMenuCategoryBar,
    "OnShow",
    function()
      d("ZO_MainMenuCategoryBar - OnShow")
      CrownPointerThing.reticle.SetHidden(true)
      ProvinatusCompass:SetHidden(true)
      ProvinatusHUD:SetHidden(true)
    end
  )
  ZO_PreHookHandler(
    ZO_MainMenuCategoryBar,
    "OnHide",
    function()
      d("ZO_MainMenuCategoryBar - OnHide")
      CrownPointerThing.reticle.SetHidden(false)
      ProvinatusCompass:SetHidden(false)
      ProvinatusHUD:SetHidden(false)
    end
  )
end
