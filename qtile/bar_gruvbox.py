from libqtile.bar import Bar
from libqtile.widget.volume import Volume
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
from colors import Gruvbox

BAR_HEIGHT = 18
# BAR_MARGIN = 5

bar = Bar([
    GroupBox(
        disable_drag=True,
        active=Gruvbox['fg'],
        inactive=Gruvbox['dark-gray'],
        highlight_method='line',
        block_highlight_text_color=Gruvbox['dark-red'],
        borderwidth=0,
        highlight_color=Gruvbox['bg'],
        background=Gruvbox['bg'],
    ),
    lower_right_triangle(Gruvbox['red'], Gruvbox['bg']),
    CurrentLayoutIcon(
        background=Gruvbox['red'],
        foreground=Gruvbox['bg'],
        padding = 4,
        scale = 0.6
    ),
    CurrentLayout(
        background=Gruvbox['red'],
        foreground=Gruvbox['bg'],
        margin=10,
    ),

    lower_right_triangle(Gruvbox['fg'], Gruvbox['red']),
    WindowCount(
        text_format='缾 {num}',
        background=Gruvbox['fg'],
        foreground=Gruvbox['bg'],
        show_zero=True,
    ),
    lower_right_triangle(Gruvbox['bg'], Gruvbox['fg']),

    WindowName(
        background=Gruvbox['bg'],
        foreground=Gruvbox['fg'],
	max_chars=25
    ),

    lower_right_triangle(Gruvbox['dark-purple'], Gruvbox['bg']),
    CPU(
        format=' {freq_current}GHz {load_percent}%',
        background=Gruvbox['dark-purple'],
        foreground=Gruvbox['bg']
    ),
    lower_right_triangle(Gruvbox['dark-blue'], Gruvbox['dark-purple']),
    Memory(
        format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
        background=Gruvbox['dark-blue'],
        foreground=Gruvbox['bg']
    ),
    lower_right_triangle(Gruvbox['dark-yellow'], Gruvbox['dark-blue']),
    Net(
	interface='wlan0',
        format='{interface}: {down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}',
        background=Gruvbox['dark-yellow'],
        foreground=Gruvbox['bg']
    ),
    lower_right_triangle(Gruvbox['dark-green'], Gruvbox['dark-yellow']),
    Battery(
         background=Gruvbox['dark-green'],
	 foreground=Gruvbox['bg'],
         format='{char} {percent:2.0%} {hour:d}:{min:02d}',
	 charge_char='  ',
	 full_char=' ',
	 discharge_char=' ',
	 update_interval = 5
    ),
    lower_right_triangle(Gruvbox['dark-red'], Gruvbox['dark-green']),
    Volume(
         background = Gruvbox['dark-red'],
         foreground = Gruvbox['bg'],
         fmt = '  {}',
    ),
    lower_right_triangle(Gruvbox['dark-aqua'], Gruvbox['dark-red']),
    Clock(
        background=Gruvbox['dark-aqua'],
        foreground=Gruvbox['bg'],
        format=' %Y-%m-%d %a 󰥔 %I:%M %p'
    ),
    lower_right_triangle(Gruvbox['bg'], Gruvbox['dark-aqua']),
    Systray(
        background=Gruvbox['bg']
    ),

],
    background=Gruvbox['bg'],
    size=BAR_HEIGHT,
    margin=0,
)
