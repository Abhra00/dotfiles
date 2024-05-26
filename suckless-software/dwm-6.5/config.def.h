/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  	  = 3;        /* border pixel of windows */
static const unsigned int fborderpx 	  = 5;        /* border pixel of floating windows */
static const unsigned int snap      	  = 32;       /* snap pixel */
static const unsigned int systrayiconsize = 20;       /* systray icon size in px */
static const unsigned int systraypinning  = 0;        /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing  = 2;        /* systray spacing */
static const int systraypinningfailfirst  = 1;        /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        	  = 1;        /* 0 means no systray */
static const unsigned int gappih    	  = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    	  = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    	  = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    	  = 30;       /* vert outer gap between windows and screen edge */
static       int smartgaps          	  = 0;        /* 1 means no outer gap when there is only one window */
static const int swallowfloating    	  = 0;        /* 1 means swallow floating windows by default */
static const int horizpadbar              = 5;        /* horizontal padding for statusbar */
static const int vertpadbar               = 10;       /* vertical padding for statusbar */
static const int vertpad                  = 10;       /* vertical padding of bar */
static const int sidepad                  = 10;       /* horizontal padding of bar */
static const int showbar            	  = 1;        /* 0 means no bar */
static const int topbar             	  = 1;        /* 0 means bottom bar */
static int floatposgrid_x           	  = 5;        /* float grid columns */
static int floatposgrid_y           	  = 5;        /* float grid rows */
static const char *fonts[]          	  = { "JetBrains Mono:size=10", "Noto Color Emoji:size=10", "FontAwesome:size=12", };
static const char dmenufont[]       	  = "JetBrains Mono Nerd Font:size=12";
static char normbgcolor[]           	  = "#1d2021";
static char normbordercolor[]       	  = "#282828";
static char normfgcolor[]           	  = "#ebdbb2";
static char selfgcolor[]            	  = "#fbf1c7";
static char selbordercolor[]        	  = "#d65d0e";
static char selbgcolor[]            	  = "#fbf1c7";
static char coltag1[]                     = "#fabd2f"; // yellow
static char coltag2[]                     = "#fb4934"; // red
static char coltag3[]                     = "#83a598"; // blue
static char coltag4[]                     = "#8ec07c"; // green
static char coltag5[]                     = "#d3869b"; // purple
static char coltag6[]                     = "#fe8019"; // orange
static char coltag7[]                     = "#b8bb26"; // bright green
static char coltag8[]                     = "#d65d0e"; // bright red
static char coltag9[]                     = "#458588"; // dark blue
static char termcol0[]                    = "#282828"; // background
static char termcol1[]                    = "#cc241d"; // red
static char termcol2[]                    = "#98971a"; // green
static char termcol3[]                    = "#d79921"; // yellow
static char termcol4[]                    = "#458588"; // blue
static char termcol5[]                    = "#b16286"; // purple
static char termcol6[]                    = "#689d6a"; // aqua
static char termcol7[]                    = "#a89984"; // gray
static char termcol8[]                    = "#928374"; // bright black
static char termcol9[]                    = "#fb4934"; // bright red
static char termcol10[]                   = "#b8bb26"; // bright green
static char termcol11[]                   = "#fabd2f"; // bright yellow
static char termcol12[]                   = "#83a598"; // bright blue
static char termcol13[]                   = "#d3869b"; // bright purple
static char termcol14[]                   = "#8ec07c"; // bright aqua
static char termcol15[]                   = "#ebdbb2"; // white

static char *termcolor[] = {
  termcol0,
  termcol1,
  termcol2,
  termcol3,
  termcol4,
  termcol5,
  termcol6,
  termcol7,
  termcol8,
  termcol9,
  termcol10,
  termcol11,
  termcol12,
  termcol13,
  termcol14,
  termcol15,
};
static char *colors[][3] = {
       /*                 fg           bg            border   */
       [SchemeNorm]   = { normfgcolor, normbgcolor,  normbordercolor },
       [SchemeSel]    = { normfgcolor, normbgcolor,  selbordercolor  },
       [SchemeTitle]  = { normfgcolor, normbgcolor,  normbordercolor },
};


/* scratchpads */
typedef struct {
       const char *name;
       const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", NULL };
const char *spcmd2[] = {"st", "-n", "spfm", "-e", "ranger", NULL };
const char *spcmd3[] = {"st", "-n", "spmusic", "-e", "ncmpcpp", NULL };
const char *spcmd4[] = {"qutebrowser", "--qt-arg", "name", "spbr", NULL };

static Sp scratchpads[] = {
       /* name           cmd  */
       {"spterm",       spcmd1},
       {"spfm",         spcmd2},
       {"spmusic",      spcmd3},
       {"spbr",         spcmd4},
};



/* sticky indicator icon */
static const XPoint stickyicon[]    = { {0,0}, {4,0}, {4,8}, {2,6}, {0,8}, {0,0} }; /* represents the icon as an array of vertices */
static const XPoint stickyiconbb    = {4,8};	/* defines the bottom right corner of the polygon's bounding box (speeds up scaling) */

/* tagging */
static const char *tags[]              = { "\uf17c", "\uf19d", "\uf269", "\uf07c", "\uf03d", "\uf15c", "\uf120", "\uf0e0", "\uf296" };
static const char *tagsalt[]           = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const int momentaryalttags      = 0;    /* 1 means alttags will show only when key is held down*/
static const unsigned int ulinepad     = 5;    /* horizontal padding between the underline and tag */
static const unsigned int ulinestroke  = 4;    /* thickness / height of the underline */
static const unsigned int ulinevoffset = 0;    /* how far above the bottom of the bar the line should appear */
static const int ulineall              = 0;    /* 1 to show underline on all tags, 0 for just the active ones */
static char *tagsel[][2] = {
       { coltag1, normbgcolor },
       { coltag2, normbgcolor },
       { coltag3, normbgcolor },
       { coltag4, normbgcolor },
       { coltag5, normbgcolor },
       { coltag6, normbgcolor },
       { coltag7, normbgcolor },
       { coltag8, normbgcolor },
       { coltag9, normbgcolor },
};



/* rules */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
       /* class       instance     title           tags mask    isfloating isterminal  noswallow   floatpos                  monitor */
	{ "Gimp",     NULL,        NULL,           0,           1,         0,          0,          NULL,                     -1 },
	{ "firefox",  NULL,        NULL,           1 << 2,      0,         0,         -1,          NULL,                     -1 },
	{ "St",       NULL,        NULL,           0,           0,         1,          0,          NULL,                     -1 },
        { NULL,       "spterm",    NULL,           SPTAG(0),    1,         0,          0,          "50% 30% 1200W 600H",     -1 },
        { NULL,       "spfm",      NULL,           SPTAG(1),    1,         0,          0,	   "50% 30% 1200W 600H",     -1 },
        { NULL,       "spmusic",   NULL,           SPTAG(2),    1,         0,          0,	   "50% 30% 1200W 600H",     -1 },
        { NULL,       "spbr",      NULL,           SPTAG(3),    1,         0,          0,          "50% 30% 1200W 600H",     -1 },
	{ NULL,       NULL,        "Event Tester", 0,           0,         0,          1,          NULL,                     -1 }, /* xev */

};



/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

/* external include */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
#define STATUSBAR "dwmblocks"
#include "shiftview.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#include <X11/XF86keysym.h> /* including function keys */
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },


/* manual stacking */
#define STACKKEYS(MOD,ACTION) \
	{ MOD, XK_j,     ACTION##stack, {.i = INC(+1) } }, \
	{ MOD, XK_k,     ACTION##stack, {.i = INC(-1) } }, \
	{ MOD, XK_grave, ACTION##stack, {.i = 0 } }, \
/*	{ MOD, XK_q,     ACTION##stack, {.i = PREVSEL } }, \  */
/*	{ MOD, XK_a,     ACTION##stack, {.i = 1 } }, \        */
/*	{ MOD, XK_z,     ACTION##stack, {.i = 2 } }, \        */
/*	{ MOD, XK_x,     ACTION##stack, {.i = -1 } },         */


/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-p", "Run:", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *pmenucmd[] = { "pmenu", NULL };

/* volume control */
static const char *vol_up[]   = { "volume", "up",   NULL };
static const char *vol_down[] = { "volume", "down", NULL };
static const char *vol_mute[] = { "volume", "mute", NULL };
static const char *mic_mute[] = { "audiomicmute",   NULL };

/* brightness control */
static const char *light_up[]   = { "backlight", "up",   NULL };
static const char *light_down[] = { "backlight", "down", NULL };

/* dmenuemojicmd */
static const char *emojicmd[]   = { "dmenuunicode",   NULL };

/* torrentcmd */
static const char *torrentcmd[]   = { "td-toggle",   NULL };

/* screenshotcmd */
static const char *sscmd[]   = { "flameshot", "gui", NULL };


static const Key keys[] = {
	/* modifier                     key        function        argument */
/*---------------------------stacker & tag keys-----------------------------*/
	STACKKEYS(MODKEY,                          		   focus)
	STACKKEYS(MODKEY|ShiftMask,                		   push)
        TAGKEYS(                        XK_1,                      0)
        TAGKEYS(                        XK_2,                      1)
        TAGKEYS(                        XK_3,                      2)
        TAGKEYS(                        XK_4,                      3)
        TAGKEYS(                        XK_5,                      4)
        TAGKEYS(                        XK_6,                      5)
        TAGKEYS(                        XK_7,                      6)
        TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
/*--------------------------end of stacker & tagkeys--------------------------*/
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
        { MODKEY|Mod1Mask,              XK_x,      spawn,          {.v = pmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			XK_e,      spawn,          {.v = emojicmd } },
	{ MODKEY|ControlMask,		XK_t,      spawn,          {.v = torrentcmd } },
	{ MODKEY|ControlMask,		XK_s,      spawn,          {.v = sscmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|Mod1Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,			XK_Up,	   shiftview,	   { .i = -1 } },
	{ MODKEY|ShiftMask,		XK_Up,	   shifttag,	   { .i = -1 } },
	{ MODKEY,			XK_Down,   shiftview,	   { .i = +1 } },
	{ MODKEY|ShiftMask,		XK_Down,   shifttag,	   { .i = +1 } },
	{ MODKEY|ControlMask,		XK_comma,  cyclelayout,    { .i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    { .i = +1 } },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY,                       XK_n,      togglealttag,   {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_s,      togglesticky,   {0} },
        { MODKEY,                       XK_y,      togglescratch,  {.ui = 0 } },
        { MODKEY,                       XK_u,      togglescratch,  {.ui = 1 } },
        { MODKEY|ShiftMask,             XK_m,      togglescratch,  {.ui = 2 } },
        { MODKEY|ShiftMask,             XK_b,      togglescratch,  {.ui = 3 } },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_F5,     xrdb,           {.v = NULL } },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} },
	/* --------------------------media controls------------------ */
	{ 0,         XF86XK_AudioMute,	           spawn,	   {.v = vol_mute } },
	{ 0,         XF86XK_AudioRaiseVolume,	   spawn,	   {.v = vol_up } },
	{ 0,         XF86XK_AudioLowerVolume,	   spawn,	   {.v = vol_down } },
	{ 0,         XF86XK_AudioMicMute,	   spawn,	   {.v = mic_mute } },
        { 0,         XF86XK_MonBrightnessUp,       spawn,          {.v = light_up } },
        { 0,         XF86XK_MonBrightnessDown,     spawn,          {.v = light_down } }, 
        /*----------------------------managing float pos---------------------------------*/
 	/* Client position is limited to monitor window area */
 	{ Mod3Mask,                     XK_u,      floatpos,       {.v = "-26x -26y" } }, // ↖
 	{ Mod3Mask,                     XK_i,      floatpos,       {.v = "  0x -26y" } }, // ↑
	{ Mod3Mask,                     XK_o,      floatpos,       {.v = " 26x -26y" } }, // ↗
	{ Mod3Mask,                     XK_j,      floatpos,       {.v = "-26x   0y" } }, // ←
	{ Mod3Mask,                     XK_l,      floatpos,       {.v = " 26x   0y" } }, // →
	{ Mod3Mask,                     XK_m,      floatpos,       {.v = "-26x  26y" } }, // ↙
	{ Mod3Mask,                     XK_comma,  floatpos,       {.v = "  0x  26y" } }, // ↓
	{ Mod3Mask,                     XK_period, floatpos,       {.v = " 26x  26y" } }, // ↘
	/* Absolute positioning (allows moving windows between monitors) */
	{ Mod3Mask|ControlMask,         XK_u,      floatpos,       {.v = "-26a -26a" } }, // ↖
	{ Mod3Mask|ControlMask,         XK_i,      floatpos,       {.v = "  0a -26a" } }, // ↑
	{ Mod3Mask|ControlMask,         XK_o,      floatpos,       {.v = " 26a -26a" } }, // ↗
	{ Mod3Mask|ControlMask,         XK_j,      floatpos,       {.v = "-26a   0a" } }, // ←
	{ Mod3Mask|ControlMask,         XK_l,      floatpos,       {.v = " 26a   0a" } }, // →
	{ Mod3Mask|ControlMask,         XK_m,      floatpos,       {.v = "-26a  26a" } }, // ↙
	{ Mod3Mask|ControlMask,         XK_comma,  floatpos,       {.v = "  0a  26a" } }, // ↓
	{ Mod3Mask|ControlMask,         XK_period, floatpos,       {.v = " 26a  26a" } }, // ↘
	/* Resize client, client center position is fixed which means that client expands in all directions */
	{ Mod3Mask|ShiftMask,           XK_u,      floatpos,       {.v = "-26w -26h" } }, // ↖
	{ Mod3Mask|ShiftMask,           XK_i,      floatpos,       {.v = "  0w -26h" } }, // ↑
	{ Mod3Mask|ShiftMask,           XK_o,      floatpos,       {.v = " 26w -26h" } }, // ↗
	{ Mod3Mask|ShiftMask,           XK_j,      floatpos,       {.v = "-26w   0h" } }, // ←
	{ Mod3Mask|ShiftMask,           XK_k,      floatpos,       {.v = "800W 800H" } }, // ·
	{ Mod3Mask|ShiftMask,           XK_l,      floatpos,       {.v = " 26w   0h" } }, // →
	{ Mod3Mask|ShiftMask,           XK_m,      floatpos,       {.v = "-26w  26h" } }, // ↙
	{ Mod3Mask|ShiftMask,           XK_comma,  floatpos,       {.v = "  0w  26h" } }, // ↓
	{ Mod3Mask|ShiftMask,           XK_period, floatpos,       {.v = " 26w  26h" } }, // ↘
	/* Client is positioned in a floating grid, movement is relative to client's current position */
	{ Mod3Mask|Mod1Mask,            XK_u,      floatpos,       {.v = "-1p -1p" } }, // ↖
	{ Mod3Mask|Mod1Mask,            XK_i,      floatpos,       {.v = " 0p -1p" } }, // ↑
	{ Mod3Mask|Mod1Mask,            XK_o,      floatpos,       {.v = " 1p -1p" } }, // ↗
	{ Mod3Mask|Mod1Mask,            XK_j,      floatpos,       {.v = "-1p  0p" } }, // ←
	{ Mod3Mask|Mod1Mask,            XK_k,      floatpos,       {.v = " 0p  0p" } }, // ·
	{ Mod3Mask|Mod1Mask,            XK_l,      floatpos,       {.v = " 1p  0p" } }, // →
	{ Mod3Mask|Mod1Mask,            XK_m,      floatpos,       {.v = "-1p  1p" } }, // ↙
	{ Mod3Mask|Mod1Mask,            XK_comma,  floatpos,       {.v = " 0p  1p" } }, // ↓
	{ Mod3Mask|Mod1Mask,            XK_period, floatpos,       {.v = " 1p  1p" } }, // ↘
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
        { ClkStatusText,        0,              Button4,        sigstatusbar,   {.i = 4} },
        { ClkStatusText,        0,              Button5,        sigstatusbar,   {.i = 5} },
        { ClkStatusText,        ShiftMask,      Button1,        sigstatusbar,   {.i = 6} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
        { ClkTagBar,            0,              Button4,        shiftview,      {.i = -1} },
        { ClkTagBar,            0,              Button5,        shiftview,      {.i = 1} },
};
