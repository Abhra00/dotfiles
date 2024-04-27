
###--------------------------------------------------------------------------------------------------------###
# ████████ ██   ██ ███████      ██████   ██████  ██████       ██████  ██████  ███    ██ ███████ ██  ██████   #
#    ██    ██   ██ ██          ██       ██    ██ ██   ██     ██      ██    ██ ████   ██ ██      ██ ██        #
#    ██    ███████ █████       ██   ███ ██    ██ ██   ██     ██      ██    ██ ██ ██  ██ █████   ██ ██   ███  #
#    ██    ██   ██ ██          ██    ██ ██    ██ ██   ██     ██      ██    ██ ██  ██ ██ ██      ██ ██    ██  #
#    ██    ██   ██ ███████      ██████   ██████  ██████       ██████  ██████  ██   ████ ██      ██  ██████   #
#                                                                                                            #
###--------------------------------------------------------------------------------------------------------###                                                                                                          





import os
import re
import random
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, hook
from libqtile.lazy import lazy
from typing import List  
from libqtile.backend.x11 import window
from libqtile.confreader import ConfigError
from libqtile.widget import base
from colors import Gruvbox
from bar_gruvbox import bar


mod      = "mod4"
terminal = "kitty"
launcher = "rofi -show drun -theme ~/.config/rofi/config.rasi"
browser  = "firefox"
logout   = "powermenu"

###-------Keybinds--------###
###-----------------------###
keys = [

###------------Switch between windows-----------###
###---------------------------------------------###
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    
###-------------Move windows---------###
###----------------------------------###
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),


###-----------Grow windows------------------###
###-----------------------------------------###
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

###-----------Grow Windows For Monadtall Layout---------###
###-----------------------------------------------------###
    Key([mod], "Down", lazy.layout.shrink(), lazy.layout.decrease_nmaster(), desc='Shrink window (MonadTall), decrease number in master pane (Tile)'),
    Key([mod], "Up", lazy.layout.grow(), lazy.layout.increase_nmaster(), desc='Expand window (MonadTall), increase number in master pane (Tile)'),



###-----------Toggle between split and unsplit side of stacks-----###
###---------------------------------------------------------------###
    Key(
        [mod, "control"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

###--------------Layout Manipulation-----------------###
###--------------------------------------------------###
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod, "control"], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),


###-------------System Controls--------------------###
###------------------------------------------------###
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.spawn(logout), desc="powermenu"),
    Key([mod], "p", lazy.spawn(launcher), desc="Spawn rofi"),
    Key([mod], "b", lazy.spawn(browser), desc="Spawn firefox"),

###--------------Multimedia keys-----------###
###----------------------------------------###
         Key([], "XF86AudioLowerVolume", lazy.spawn("volume down")),
         Key([], "XF86AudioRaiseVolume", lazy.spawn("volume up")),
         Key([], "XF86AudioMute", lazy.spawn("volume mute")),
	 Key([], "XF86MonBrightnessUp", lazy.spawn("backlight up")), 
	 Key([], "XF86MonBrightnessDown", lazy.spawn("backlight down")),

###--------------Scratchpads---------------###
###----------------------------------------###
         Key([mod], "y", lazy.group['scratchpad'].dropdown_toggle('term')),
         Key([mod], "t", lazy.group['music'].dropdown_toggle('tunes')),
	 Key([mod], "u", lazy.group['fm'].dropdown_toggle('filemanager')),

]



#-------Groups-------#
#--------------------#
groups = [Group(" 1 ", layout='monadtall'),
          Group(" 2 ", layout='monadtall'),
          Group(" 3 ", layout='monadtall', matches=[Match(wm_class="firefox")]),
          Group(" 4 ", layout='monadtall'),
          Group(" 5 ", layout='monadtall'),
          Group(" 6 ", layout='monadtall'),
          Group(" 7 ", layout='monadtall'),
          Group(" 8 ", layout='monadtall'),
          Group(" 9 ", layout='monadtall'),

###--------Scratchpads---------###
###----------------------------###
          ScratchPad("music",[DropDown("tunes", "kitty -e ncmpcpp", x=0.05, y=0.02, width=0.90, height=0.6, on_focus_lost_hide=False)]),
	  ScratchPad("fm",[DropDown("filemanager", "kitty -e ranger", x=0.05, y=0.02, width=0.90, height=0.6, on_focus_lost_hide=False)]),
          ScratchPad("scratchpad",[DropDown("term", "kitty", x=0.12, y=0.02, width=0.75, height=0.6, on_focus_lost_hide=False)]),

]

###--------Binding Group Keys--------------###
###----------------------------------------###
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")



###------------Layout settings------------###
###---------------------------------------###
layout_theme = {"border_width": 3,
                "margin": 5,
                "border_focus": Gruvbox['dark-red'],
                "border_normal": Gruvbox['dark-gray']
}

layout_floating_theme = {"border_width": 5,
                         "border_focus": Gruvbox['dark-purple'],
			 "border_normal": Gruvbox['dark-gray']
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Floating(**layout_floating_theme),
    layout.Max(**layout_theme),
    layout.Stack(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="JetBrains Mono Nerd Font",
    fontsize=14,
    padding=3,
    background='282828',
)
extension_defaults = widget_defaults.copy()

###-----------------------setting up wallpaper and bar---------------------------###
###------------------------------------------------------------------------------###
def get_random_image_filepath(directory):
    full_directory_path = os.path.abspath(directory)
    print("Full directory path:", full_directory_path)
    image_files = [f for f in os.listdir(full_directory_path) if f.endswith('.png') or f.endswith('.jpg')]
    if not image_files:
        raise ValueError("No .png or .jpg files found in the directory.")
    random_image_filename = random.choice(image_files)
    random_image_filepath = os.path.join(full_directory_path, random_image_filename)
    return random_image_filepath

directory_path = '/home/bugs/wallpapers/gruvbox-wallpapers/'
random_image_path = get_random_image_filepath(directory_path)

screens = [
    Screen(top=bar,
    wallpaper=random_image_path,
    wallpaper_mode='fill'
    )
]


###---------Drag floating layouts-------###
###-------------------------------------###
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating( **layout_floating_theme,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="thunar"),  # file manager
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


###---------Autostart--------###
###--------------------------###
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])



# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

