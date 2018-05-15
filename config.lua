-- Note ALL settings are overridden by saved variables.
ProvinatusConfig = {
  CrownPointer = {
    -- Controls transparency of the central crown pointer thing.
    Enabled = true,
    Alpha = 1,
    Size = 50,
    Texture = "esoui/art/floatingmarkers/quest_icon_assisted.dds"
  },
  PlayerIcons = {
    Dead = "/esoui/art/icons/poi/poi_groupboss_incomplete.dds",
    ResurrectionPending = "/esoui/art/icons/poi/poi_groupboss_complete.dds",
    Crown = {
      Alive = "EsoUI/Art/Compass/groupLeader.dds",
    },
    dps = {
      Alive = "/esoui/art/lfg/lfg_dps_up.dds",
    },
    tank = {
      Alive = "/esoui/art/lfg/lfg_tank_up.dds",
    },
    healer = {
      Alive = "/esoui/art/lfg/lfg_healer_up.dds",
    }
  },
  HUD = {
    Enabled = true,
    Size = 350,
    ShowRoleIcons = false,
    TargetIconAlpha = 1,
    TargetIconSize = 48,
    PlayerIconAlpha = 1,
    PlayerIconSize = 24,
    Compass = {
      -- TODO use this flag
      Enabled = true,
      Alpha = 1
    }
  },
  Debug = false,
  DebugSettings = {
    -- If enabled, allows you to set crown position on map instead of just setting the angle.
    CrownPositionOverride = false,
    -- Target x position on the map
    TargetX = 0.5,
    -- Target y position on the map
    TargetY = 0.5,
    -- Force show the compass
    ShowCompass = false,
    Reticle = {
      DistanceToTarget = 0,
      AngleToTarget = 0.0,
      Linear = 0,
      AbsoluteLinear = 0
    }
  }
}
