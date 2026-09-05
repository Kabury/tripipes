meld = require("meld")

local created_eff =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {type = "script", effect_id = "tripipes-built-event"}
    }
  }
}

local tripipes_protos = {}
local tripipes_items = 
{}


local chars = {"T","A","B","C"}

for _,name in pairs(chars) do
  tripipes_items[#tripipes_items + 1] = meld.meld(
    table.deepcopy(data.raw["item"]["pipe"]),
    {
      name="tripipes-"..name,
      place_result = "tripipes-"..name,
      subgroup = "tripipes"
    }
    )
  tripipes_protos[#tripipes_protos+1] = meld.meld(
    table.deepcopy(data.raw["pipe"]["pipe"]),
    {
      name="tripipes-"..name,
      minable={mining_time = 0.1,result="tripipes-"..name},
      npt_compat={mod="tripipes",tag="tripipes-"..name}
    }
    )
end
for _,name in pairs(chars) do
  tripipes_items[#tripipes_items + 1] = meld.meld(
    table.deepcopy(data.raw["item"]["pipe-to-ground"]),
    {
      name="ground-tripipes-"..name,
      place_result = "ground-tripipes-"..name,
      subgroup = "tripipes"}
  )
  tripipes_protos[#tripipes_protos+1] = meld.meld(
    table.deepcopy(
      data.raw["pipe-to-ground"]["pipe-to-ground"]),
      {
        name="ground-tripipes-"..name,
        minable={mining_time = 0.1,result="ground-tripipes-"..name},
        npt_compat={mod="tripipes",tag="tripipes-"..name}
      }
      )
end

tripipes_protos[1].created_effect=created_eff
tripipes_protos[5].created_effect=created_eff


for i=1,4 do
  tripipes_items[i].icons=
  {
    {
      icon=tripipes_items[i].icon,
      icon_size=64
    },
    {
      icon="__tripipes__/characters/"..chars[i]..".png",
      shift={-16,-0}
    }
  }
end
for i=5,8 do
  tripipes_items[i].icons=
  {
    {
      icon=tripipes_items[i].icon,
      icon_size=64
    },
    {
      icon="__tripipes__/characters/"..chars[i-4]..".png",
      shift={-16,-0}
    }
  }
end

tripipes_items[#tripipes_items + 1] = {
    type = "item-subgroup",
    name = "tripipes",
    group = "logistics",
    order = "tripipes"
  }

data:extend(tripipes_protos)
data:extend(tripipes_items)

require("recipes")
require("technologies")