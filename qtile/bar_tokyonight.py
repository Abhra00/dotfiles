from libqtile import qtile
from libqtile.bar import Bar
from libqtile.widget.battery import Battery
from libqtile.widget.clock import Clock
from libqtile.widget.cpu import CPU
from libqtile.widget.currentlayout import CurrentLayout, CurrentLayoutIcon
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.image import Image
from libqtile.widget.memory import Memory
from libqtile.widget.net import Net
from libqtile.widget.sep import Sep
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.volume import Volume
from libqtile.widget.window_count import WindowCount
from libqtile.widget.windowname import WindowName

from colors import TokyoNight
from unicodes import (
    left_arrow,
    left_half_circle,
    lower_left_triangle,
    lower_right_triangle,
    right_arrow,
    right_half_circle,
)

BAR_HEIGHT = 18
# BAR_MARGIN = 5

bar = Bar(
    [
        Sep(
            linewidth=0,
            padding=10,
            foreground=TokyoNight["color0"],
            background=TokyoNight["color11"],
        ),
        Image(
            filename="~/.config/qtile/icons/qtile.png",
            scale="False",
            background=TokyoNight["color11"],
            margin_y=-2,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(
                    "rofi -show drun -theme ~/.config/rofi/config.rasi"
                )
            },
        ),
        lower_right_triangle(TokyoNight["color0"], TokyoNight["color11"]),
        GroupBox(
            font="FontAwesome Bold",
            fontsize=12,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=5,
            borderwidth=3,
            rounded=False,
            active=TokyoNight["color5"],
            inactive=TokyoNight["color4"],
            highlight_color=TokyoNight["color0"],
            highlight_method="line",
            this_current_screen_border=TokyoNight["color11"],
            this_screen_border=TokyoNight["color11"],
            other_current_screen_border=TokyoNight["color9"],
            other_screen_border=TokyoNight["color11"],
            foreground=TokyoNight["color5"],
            background=TokyoNight["color0"],
        ),
        lower_right_triangle(TokyoNight["color11"], TokyoNight["color0"]),
        CurrentLayoutIcon(
            background=TokyoNight["color11"],
            foreground=TokyoNight["color0"],
            padding=4,
            scale=0.6,
        ),
        CurrentLayout(
            background=TokyoNight["color11"],
            foreground=TokyoNight["color0"],
            margin=10,
        ),
        lower_right_triangle(TokyoNight["color5"], TokyoNight["color11"]),
        WindowCount(
            text_format="󱂬 {num}",
            background=TokyoNight["color5"],
            foreground=TokyoNight["color0"],
            show_zero=True,
        ),
        lower_right_triangle(TokyoNight["color0"], TokyoNight["color5"]),
        WindowName(
            background=TokyoNight["color0"],
            foreground=TokyoNight["color5"],
            max_chars=25,
        ),
        lower_right_triangle(TokyoNight["color15"], TokyoNight["color0"]),
        CPU(
            format=" {freq_current}GHz {load_percent}%",
            background=TokyoNight["color15"],
            foreground=TokyoNight["color0"],
        ),
        lower_right_triangle(TokyoNight["color7"], TokyoNight["color15"]),
        Memory(
            format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",
            background=TokyoNight["color7"],
            foreground=TokyoNight["color0"],
        ),
        lower_right_triangle(TokyoNight["color13"], TokyoNight["color7"]),
        Net(
            interface="wlo1",
            format="󰤨 {down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}",
            background=TokyoNight["color13"],
            foreground=TokyoNight["color0"],
        ),
        lower_right_triangle(TokyoNight["color9"], TokyoNight["color13"]),
        Battery(
            background=TokyoNight["color9"],
            foreground=TokyoNight["color0"],
            format="{char} {percent:2.0%} {hour:d}:{min:02d}",
            charge_char="  ",
            full_char=" ",
            unknown_char="󱧥",
            discharge_char=" ",
            update_interval=5,
        ),
        lower_right_triangle(TokyoNight["color11"], TokyoNight["color9"]),
        Volume(
            background=TokyoNight["color11"],
            foreground=TokyoNight["color0"],
            fmt="  {}",
        ),
        lower_right_triangle(TokyoNight["color8"], TokyoNight["color11"]),
        Clock(
            background=TokyoNight["color8"],
            foreground=TokyoNight["color0"],
            format=" %Y-%m-%d %a 󰥔 %I:%M %p",
        ),
        lower_right_triangle(TokyoNight["color0"], TokyoNight["color8"]),
        Systray(background=TokyoNight["color0"]),
    ],
    background=TokyoNight["color0"],
    size=BAR_HEIGHT,
    margin=0,
)
