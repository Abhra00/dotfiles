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

from unicodes import left_half_circle, lower_right_triangle, left_arrow, right_half_circle, lower_left_triangle, lower_right_triangle
from colors import Oxide

BAR_HEIGHT = 18
# BAR_MARGIN = 5

bar = Bar([
    Sep(
        linewidth=0, 
        padding=10,
        foreground=Oxide['cyan'], 
        background = Oxide['cyan']
    ),
    Image(
        filename="~/.config/qtile/icons/qtile.png",
        scale="False",
        background=Oxide['cyan'],
        margin_y=-2,
	mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show drun -theme ~/.config/rofi/config.rasi")}             
    ),
    lower_right_triangle(Oxide['background'], Oxide['cyan']),
    GroupBox(
        font = "FontAwesome Bold", fontsize = 12,
        margin_y = 3, margin_x = 0, padding_y = 5, padding_x = 5,
        borderwidth = 3, rounded = False,
        active = Oxide['cyan'], inactive = Oxide['gray'],
        highlight_color = Oxide['background'], highlight_method = "line",
        this_current_screen_border = Oxide['red'], this_screen_border = Oxide ['red'],
        other_current_screen_border = Oxide['green'], other_screen_border = Oxide['red'],
        foreground = Oxide['foreground'], background = Oxide['background']
    ),
    lower_right_triangle(Oxide['red'], Oxide['background']),
    CurrentLayoutIcon(
        background=Oxide['red'],
        foreground=Oxide['background'],
        padding = 4,
        scale = 0.6
    ),
    CurrentLayout(
        background=Oxide['red'],
        foreground=Oxide['background'],
        margin=10,
    ),

    lower_right_triangle(Oxide['cyan'], Oxide['red']),
    WindowCount(
        text_format='缾 {num}',
        background=Oxide['cyan'],
        foreground=Oxide['background'],
        show_zero=True,
    ),
    lower_right_triangle(Oxide['background'], Oxide['cyan']),

    WindowName(
        background=Oxide['background'],
        foreground=Oxide['foreground-alt'],
	max_chars=25
    ),

    lower_right_triangle(Oxide['red'], Oxide['background']),
    CPU(
        format=' {freq_current}GHz {load_percent}%',
        background=Oxide['red'],
        foreground=Oxide['background']
    ),
    lower_right_triangle(Oxide['green'], Oxide['red']),
    Memory(
        format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
        background=Oxide['green'],
        foreground=Oxide['background']
    ),
    lower_right_triangle(Oxide['yellow'], Oxide['green']),
    Net(
	interface='wlan0',
        format='{interface}: {down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}',
        background=Oxide['yellow'],
        foreground=Oxide['background']
    ),
    lower_right_triangle(Oxide['blue'], Oxide['yellow']),
    Battery(
         background=Oxide['blue'],
	 foreground=Oxide['background'],
         format='{char} {percent:2.0%} {hour:d}:{min:02d}',
	 charge_char='  ',
	 full_char=' ',
	 discharge_char=' ',
	 update_interval = 5
    ),
    lower_right_triangle(Oxide['magenta'], Oxide['blue']),
    Volume(
         background = Oxide['magenta'],
         foreground = Oxide['background'],
         fmt = '  {}',
    ),
    lower_right_triangle(Oxide['cyan'], Oxide['magenta']),
    Clock(
        background=Oxide['cyan'],
        foreground=Oxide['background'],
        format=' %Y-%m-%d %a 󰥔 %I:%M %p'
    ),
    lower_right_triangle(Oxide['background'], Oxide['cyan']),
    Systray(
        background=Oxide['background']
    ),

],
    background=Oxide['background'],
    size=BAR_HEIGHT,
    margin=0,
)
