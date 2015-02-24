--
-- xmonad config file.
--
-- (c) Antoine Albertelli 2014
 
import XMonad
import XMonad.Util.EZConfig -- used for key bindings
import XMonad.Config.Gnome

-- Allow management of dock programs.
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
 
keyBindings = [
    ("M-w", spawn "chromium"),
    ("M-S-w", spawn "chromium --incognito"),
    ("M-e", spawn "nautilus --new-window"),
    ("M-p", spawn "dmenu_recent_aliases")
    ]

startup = do
    spawn "dispwin /etc/out.icc"
    spawn "xmobar ~/.xmonad/xmobarrc"

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore ]


defaults = defaultConfig {
      -- simple stuff
        terminal           = "terminator",
        startupHook        = startup,
        borderWidth        = 1,
        modMask            = mod1Mask,
        manageHook         = manageDocks <+> manageHook defaultConfig,
        layoutHook         = avoidStruts $ layoutHook defaultConfig,
        focusedBorderColor = "#000000",
        normalBorderColor  = "#888888"
        --layoutHook         = smartBorders $ layoutHook defaultConfig
    } `additionalKeysP` keyBindings

main = xmonad defaults

