--
-- xmonad config file.
--
-- (c) Antoine Albertelli 2014
 
import XMonad
import XMonad.Util.EZConfig -- used for key bindings

-- Allow management of dock programs.
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
 
keyBindings = [
    ("M-w", spawn "chromium"),
    ("M-S-w", spawn "chromium --incognito"),
    ("M-e", spawn "nautilus --new-window"),
    ("M-p", spawn "dmenu_run")
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
        manageHook         = manageDocks <+> manageHook defaultConfig,
        layoutHook         = avoidStruts $ layoutHook defaultConfig,
        focusedBorderColor = "#000000",
        normalBorderColor  = "#888888"
        --layoutHook         = smartBorders $ layoutHook defaultConfig
    } `additionalKeysP` keyBindings

main = xmonad defaults

