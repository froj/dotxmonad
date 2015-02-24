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
 
-- For Java GUIs like MATLAB
import XMonad.Hooks.SetWMName
 
keyBindings = [
    ("M-w", spawn "chromium"),
    ("M-S-w", spawn "chromium --incognito"),
    ("M-e", spawn "nautilus --new-window"),
    ("M-p", spawn "dmenu_recent_aliases")
    ]

startup = do
    setWMName "LG3D"
    spawn "dispwin /etc/out.icc"
    spawn "xmobar ~/.xmonad/xmobarrc"
    -- spawn "xautolock -time 5 -locker 'sudo pm-suspend' -corners ---- -notify 10 -notifier \"notify-send -t 10000 -i gtk-dialog-info 'Suspending in 10 seconds'\""

myManageHook = composeAll
    [ className =? "MPlayer"                --> doFloat
    , className =? "Gimp"                   --> doFloat
    , className =? "~/MATLAB/bin/matlab"    --> doFloat
    , resource  =? "desktop_window"         --> doIgnore ]


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

