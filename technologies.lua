data:extend(
{
  {
    type = "technology",
    name = "tripipes",
    effects = 
    {
      { type = "unlock-recipe", recipe = "tripipes-A" },
      { type = "unlock-recipe", recipe = "tripipes-B" },
      { type = "unlock-recipe", recipe = "tripipes-C" },
      { type = "unlock-recipe", recipe = "tripipes-T" },
      { type = "unlock-recipe", recipe = "ground-tripipes-A" },
      { type = "unlock-recipe", recipe = "ground-tripipes-B" },
      { type = "unlock-recipe", recipe = "ground-tripipes-C" },
      { type = "unlock-recipe", recipe = "ground-tripipes-T" }
    },
    icons = 
    {
      { icon = "__tripipes__/thumbnail.png", icon_size = 256 }
    },
    prerequisites = { "fluid-handling" },
    unit = 
    {
      count = 100,
      ingredients = 
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 }
      },
      time = 30
    }
  }
}
)