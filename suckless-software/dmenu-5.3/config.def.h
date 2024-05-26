/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                 /* minimum width when centered */
static const unsigned int alpha = 0xff;     /* Amount of opacity. 0xff is opaque */
/* -fn option overrides fonts[0]; default X11 font or font set */
static char font[] = "JetBrains Mono Nerd Font:size=12";
static char *fonts[] = {
       font,
       "NotoColorEmoji:pixelsize=8:antialias=true:autohint=true"
};

static char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static char normfgcolor[] = "#ebdbb2";
static char normbgcolor[] = "#1d2021";
static char selfgcolor[]  = "#1d2021";
static char selbgcolor[]  = "#689d6a";
static char *colors[SchemeLast][2] = {
	/*               fg           bg         */
        [SchemeNorm] = { normfgcolor, normbgcolor },
        [SchemeSel]  = { selfgcolor,  selbgcolor  },
        [SchemeOut]  = { "#000000",   "#00ffff" },

};

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel] = { OPAQUE, alpha },
	[SchemeOut] = { OPAQUE, alpha },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 10;
static unsigned int columns    = 1;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 2;

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
        { "font",        STRING, &font },
        { "color15",     STRING, &normfgcolor },
        { "color0",      STRING, &normbgcolor },
        { "color0",      STRING, &selfgcolor },
        { "color4",      STRING, &selbgcolor },
        { "prompt",      STRING, &prompt },
};
