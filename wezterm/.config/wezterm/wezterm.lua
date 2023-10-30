--#| wezterm API |#--
local wezterm   = require 'wezterm'

--#| configuration |#--
local config    = {}

--#| error messages |#--
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--#| mouse |#--
config.mouse_bindings = {
    {
        event = {Down = {streak = 1, button = "Right"}},
        mods = "NONE",
        action = wezterm.action {PasteFrom = "Clipboard"}
    },
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "NONE",
        action = wezterm.action {CompleteSelection = "PrimarySelection"}
    },
    -- and make CTRL-Click open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "CTRL",
        action = "OpenLinkAtMouseCursor"
    }
}

--#| keys |#--
config.leader = { key="b", mods="CTRL" }
config.disable_default_key_bindings = true
config.keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        -- { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "|", mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "h", mods = "CTRL|SHIFT",   action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "j", mods = "CTRL|SHIFT",   action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "k", mods = "CTRL|SHIFT",   action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "l", mods = "CTRL|SHIFT",   action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "h", mods = "CTRL|ALT",     action=wezterm.action{AdjustPaneSize={"Left", 1}}},
        { key = "j", mods = "CTRL|ALT",     action=wezterm.action{AdjustPaneSize={"Down", 1}}},
        { key = "k", mods = "CTRL|ALT",     action=wezterm.action{AdjustPaneSize={"Up", 1}}},
        { key = "l", mods = "CTRL|ALT",     action=wezterm.action{AdjustPaneSize={"Right", 1}}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
        { key = "f", mods = "LEADER",       action="ToggleFullScreen" },
        { key = "v", mods = "SHIFT|CTRL",   action=wezterm.action.PasteFrom 'Clipboard'},
        { key = "c", mods = "SHIFT|CTRL",   action=wezterm.action.CopyTo 'Clipboard'},
        { key = "LeftArrow",  mods = "ALT",action=wezterm.action.ActivateTabRelative(-1) },
        { key = "RightArrow", mods = "ALT",action=wezterm.action.ActivateTabRelative(1) },
        { key = "PageUp",   mods = "SHIFT", action=wezterm.action.ScrollByPage(-1) },
        { key = "PageDown", mods = "SHIFT", action=wezterm.action.ScrollByPage(1) },
        { key = "+", mods = "CTRL",         action=wezterm.action.IncreaseFontSize },
        { key = "-", mods = "CTRL",         action=wezterm.action.DecreaseFontSize },
        { key = "0", mods = "CTRL",         action=wezterm.action.ResetFontSize },
        { key = "P", mods = "CTRL",         action=wezterm.action.ActivateCommandPalette },
    }

--#| cursor |#--
config.default_cursor_style             = 'BlinkingUnderline'
config.cursor_blink_rate                = 550

--#| scrollbar |#--
config.enable_scroll_bar                = false
config.scrollback_lines                 = 999999

--#| font |#--
config.font_size                        = 12.0
config.adjust_window_size_when_changing_font_size   = false
config.font_rules = {
{
    intensity = "Bold",
    italic = false,
    font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
},
{
    intensity = "Bold",
    italic = true,
    font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
},
}

--#| tab bar |#--
config.tab_bar_at_bottom                = true
config.hide_tab_bar_if_only_one_tab     = true
config.use_fancy_tab_bar                = false
config.tab_max_width                    = 32

--#| misc |#--
config.default_prog                     = { "bash", "-l" }
config.audible_bell                     = "Disabled"
config.check_for_updates                = false
config.window_close_confirmation        = "NeverPrompt"
config.use_dead_keys                    = false
config.warn_about_missing_glyphs        = false
config.window_decorations               = "NONE"
config.window_padding                   = { top = 0, bottom = 0, left = 0, right = 0 }
config.pane_focus_follows_mouse         = false
config.window_background_opacity        = 0.95
config.enable_kitty_graphics            = true

--#| background on inactive panes |#--
config.inactive_pane_hsb = {
 saturation = 0.8,
 brightness = 0.7,
}

--#| colorscheme |#--
config.color_scheme             = 'Gruvbox Dark Hard'
config.color_schemes = {
    ["Gruvbox Dark Hard"] = {
      -- The default text color
      foreground                = "#ebdbb2",
      -- The default background color
      background                = "#1d2021",
      -- Overrides the cell background color when the current cell is occupied by the
      -- cursor and the cursor style is set to Block
      cursor_bg                 = "#ebdbb2",
      -- Overrides the text color when the current cell is occupied by the cursor
      cursor_fg                 = "#333333",
      -- Specifies the border color of the cursor when the cursor style is set to Block,
      -- of the color of the vertical or horizontal bar when the cursor style is set to
      -- Bar or Underline.
      cursor_border             = "#ebdbb2",
      -- the foreground color of selected text
      selection_fg              = "#333333",
      -- the background color of selected text
      selection_bg              = "#ebdbb2",
      -- The color of the scrollbar "thumb"; the portion that represents the current viewport
      scrollbar_thumb           = "#333333",
      -- The color of the split lines between panes
      split                     = "#333333",
      ansi = {
        "#282828",
        "#cc241d",
        "#98971a",
        "#d79921",
        "#458588",
        "#b16286",
        "#689d6a",
        "#a89984",
      },
      brights = {
        "#928374",
        "#fb4934",
        "#b8bb26",
        "#fabd2f",
        "#83a598",
        "#d3769b",
        "#8ec07c",
        "#ebdbb2",
      },
    },
  }

--#| return the configuration to wezterm |#--
return config
