from libqtile import qtile
from libqtile.bar import Bar
from libqtile.widget.volume import Volume
from libqtile.widget.sep import Sep
from libqtile.widget.image import Image
from libqtile.widget.currentlayout import CurrentLayoutIcon
from libqtile.widget.battery import Battery
from libqtile.widget.clock import Clock
from libqtile.widget.cpu import CPU
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.memory import Memory
from libqtile.widget.net import Net
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.window_count import WindowCount
from libqtile.widget.windowname import WindowName
from unicodes import left_half_circle, right_arrow, left_arrow, right_half_circle, lower_left_triangle, lower_right_triangle
from colors import Nordic

BAR_HEIGHT = 18
# BAR_MARGIN = 5

bar = Bar([
    Sep(
        linewidth=0,
        padding=10,
        foreground=Nordic['nord0'],
        background = Nordic['nord11']
    ),
    Image(
        filename="~/.config/qtile/icons/qtile.png",
        scale="False",
        background=Nordic['nord11'],
        margin_y=-2,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show drun -theme ~/.config/rofi/config.rasi")}
    ),
    lower_right_triangle(Nordic['nord0'], Nordic['nord11']),
    GroupBox(
        font = "FontAwesome Bold", fontsize = 12,
        margin_y = 3, margin_x = 0, padding_y = 5, padding_x = 5,
        borderwidth = 3, rounded = False,
        active = Nordic['nord4'], inactive = Nordic['nord3'],
        highlight_color = Nordic['nord0'], highlight_method = "line",
        this_current_screen_border = Nordic['nord11'], this_screen_border = Nordic ['nord11'],
        other_current_screen_border = Nordic['nord12'], other_screen_border = Nordic['nord11'],
        foreground = Nordic['nord4'], background = Nordic['nord0']
    ),    
    lower_right_triangle(Nordic['nord3'], Nordic['nord0']),
    CurrentLayoutIcon(
        background=Nordic['nord3'],
        foreground=Nordic['nord4'],
        padding = 4,
        scale = 0.6
    ),
    CurrentLayout(
        background=Nordic['nord3'],
        foreground=Nordic['nord4'],
        margin=10,
    ),

    lower_right_triangle(Nordic['nord4'], Nordic['nord3']),
    WindowCount(
        text_format='缾 {num}',
        background=Nordic['nord4'],
        foreground=Nordic['nord0'],
        show_zero=True,
    ),
    lower_right_triangle(Nordic['nord0'], Nordic['nord4']),

    WindowName(
        background=Nordic['nord0'],
        foreground=Nordic['nord4'],
	max_chars=25
    ),

    lower_right_triangle(Nordic['nord12'], Nordic['nord0']),
    CPU(
        format=' {freq_current}GHz {load_percent}%',
        background=Nordic['nord12'],
        foreground=Nordic['nord0']
    ),
    lower_right_triangle(Nordic['nord13'], Nordic['nord12']),
    Memory(
        format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
        background=Nordic['nord13'],
        foreground=Nordic['nord0']
    ),
    lower_right_triangle(Nordic['nord14'], Nordic['nord13']),
    Net(
	interface='wlan0',
        format='{interface}: {down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}',
        background=Nordic['nord14'],
        foreground=Nordic['nord0']
    ),
    lower_right_triangle(Nordic['nord15'], Nordic['nord14']),
    Battery(
         background=Nordic['nord15'],
	 foreground=Nordic['nord0'],
         format='{char} {percent:2.0%} {hour:d}:{min:02d}',
	 charge_char='  ',
	 full_char=' ',
	 discharge_char=' ',
	 update_interval = 5
    ),
    lower_right_triangle(Nordic['nord11'], Nordic['nord15']),
    Volume(
         background = Nordic['nord11'],
         foreground = Nordic['nord0'],
         fmt = '  {}',
    ),
    lower_right_triangle(Nordic['nord12'], Nordic['nord11']),
    Clock(
        background=Nordic['nord12'],
        foreground=Nordic['nord0'],
        format=' %Y-%m-%d %a 󰥔 %I:%M %p'
    ),
    lower_right_triangle(Nordic['nord0'], Nordic['nord12']),
    Systray(
        background=Nordic['nord0']
    ),

],
    background=Nordic['nord0'],
    size=BAR_HEIGHT,
    margin=0,
)
