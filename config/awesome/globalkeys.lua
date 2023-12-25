local awful = require("awful")
local menubar = require("menubar")
globalkeys = awful.util.table.join(
  awful.key({ modkey, }, "Left", awful.tag.viewprev),
  awful.key({ modkey, }, "Right", awful.tag.viewnext),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore),

  awful.key({ modkey, }, "j",
    function()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, }, "k",
    function()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, }, "w", function() mymainmenu:show() end),

  -- Layout manipulation
  awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end),
  awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end),
  awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end),
  awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end),
  awful.key({ modkey, }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey, }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end),

  -- Standard program
  awful.key({ modkey, }, "Return", function() awful.util.spawn(terminal) end),
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift" }, "q", awesome.quit),
  awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end),
  awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end),
  awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1) end),
  awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1) end),
  awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1) end),
  awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1) end),
  awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(layouts, 1) end),
  --awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(layouts, -1) end),
  awful.key({ modkey, "Control" }, "n", awful.client.restore),

  -- Prompt
  awful.key({ modkey }, "r", function() mypromptbox[mouse.screen.index]:run() end),

  awful.key({ modkey }, "x",
    function()
      awful.prompt.run({ prompt = "Run Lua code: " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end),
  -- Menubar
  awful.key({ modkey }, "p", function() menubar.show() end),

  -- Volume control
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10% ", false)
  end),
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10% ", false)
  end),

  -- Brightness control
  awful.key({}, "XF86MonBrightnessUp ", function()
    awful.util.spawn("xbacklight -inc 5")
  end),
  awful.key({}, "XF86MonBrightnessDown ", function()
    awful.util.spawn("xbacklight -dec 5")
  end)
)

return globalkeys;
