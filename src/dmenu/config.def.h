static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = { "JetBrainsMono Nerd Font:size=11" };
static const char *prompt      = "Search: ";      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     				fg         bg       */
	[SchemeNorm] = { "#c6c1b9", "#1a1a1a" },
	[SchemeSel] = { "#1a1a1a", "#a39b8f" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
