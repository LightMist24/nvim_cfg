local spec = {
 "hoofcushion/rainbowcursor.nvim",
 cmd = { "RainbowCursor" },
 opts = {
  rainbowcursor = {
   hlgroup = "RainbowCursor",
   -- The RainbowCursor High Light Group's name.
   autocmd = {
    autostart = true,
    -- Whether or not to automatically start autocmd after setup.
    loopover = 36,
    -- How many time that the event triggered will loop over the color table.
    group = "RainbowCursor",
    -- The RainbowCursor Autocmd Group's name .
    event = { "CursorMoved", "CursorMovedI" },
    -- The RainbowCursor Autocmd's trigger event .
   },
   timer = {
    autostart = true,
    -- Whether or not to automatically start timer after setup.
    loopover = 180,
    -- How many time that the timer triggered will loop over the color table.
    interval = 100,
    -- The interval of timer to be triggered (in milliseconds).
   },
   channels = {
    format = "hsl",
    -- Color format, could be "hsl" "rgb" or a function that takes variable parameters and return 3 number: r,g,b.
    -- format=function(a,b,c...x,y,z) return r,g,b end
    -- The inputs are defined by the following array:
    { { 0, 360, 1 } },
    -- The 1st input of color format function, default is the hue of hsl
    { { 100, 100, 0 } },
    -- The 2nd input of color format function, default is the saturation of hsl
    { { 50, 50, 0 } },
    -- The 3rd input of color format function, default is the lightness of hsl
   },
  },
  others = {
   create_cmd = true,
   -- Create command "RainbowCursor" after setup.
   -- If use API, cmd may not necessary.
   create_var = true,
   -- Create Lua global variable "_G.RainbowCursor" after setup.
   create_api = true,
   -- Create a Module API after setup.
   -- require("rainbowcursor").API,
   -- If it sets false, you can still use
   -- require("rainbowcursor.api").
  },
 },
 dependencies = {
  "hoofcushion/hcutil.nvim",
 },
}

return spec
