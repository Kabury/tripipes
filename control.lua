local chars = {"A","B","C"}

---@param event EventData.on_script_trigger_effect
local function on_tripipe_built(event)
  local built = event.effect_id == "tripipes-built-event"
  if not built then return end
  if not event.target_entity then return end
  local Tpipe = event.target_entity
  local name = "tripipes-" 
  if Tpipe.name == "ground-tripipes-T" then name = "ground-"..name end
  local surface = Tpipe.surface
  local position = Tpipe.position
  local force = Tpipe.force
  ---@cast force LuaForce
  
  for _,channel in pairs(chars) do
    surface.create_entity{name=name..channel,position=position,force=force,direction = Tpipe.direction,mirror=Tpipe.mirroring}
  end

  Tpipe.destroy()
end

script.on_event(defines.events.on_script_trigger_effect, on_tripipe_built)

---@param event EventData.on_player_mined_entity
local function on_tripipe_mined(event)
  local entity = event.entity
  if entity.name ~= "tripipes-C" and entity.name ~= "ground-tripipes-C" then return end
  
  local position = entity.position
  local surface = entity.surface

  local others = surface.find_entities_filtered{name = {"tripipes-A", "tripipes-B", "ground-tripipes-A", "ground-tripipes-B"}}

  local buffer = event.buffer
  for _,pipe in pairs(others) do
    buffer.insert{name=pipe.name,count=1}
    pipe.destroy()
  end

  entity.destroy()
end

script.on_event(defines.events.on_player_mined_entity,on_tripipe_mined)