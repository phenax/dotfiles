"""Qutebrowser configuration"""
import os
import re
import sys
import json
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config = config
c = c

# Helper Functions {{{
def bind(key, command, mode):  # noqa: E302
    """Bind key to command in mode."""
    config.bind(key, command, mode=mode)


def nmap(key, command):
    """Bind key to command in normal mode."""
    bind(key, command, 'normal')


def imap(key, command):
    """Bind key to command in insert mode."""
    bind(key, command, 'insert')


def cmap(key, command):
    """Bind key to command in command mode."""
    bind(key, command, 'command')

def tmap(key, command):
    """Bind key to command in caret mode."""
    bind(key, command, 'caret')


def pmap(key, command):
    """Bind key to command in passthrough mode."""
    bind(key, command, 'passthrough')


def unmap(key, mode):
    """Unbind key in mode."""
    config.unbind(key, mode=mode)


def nunmap(key):
    """Unbind key in normal mode."""
    unmap(key, mode='normal')
# }}}


#### Config ####


#### Settings {{{
c.backend = "webengine"
c.auto_save.session = True
c.session.lazy_restore = True
c.content.autoplay = False
c.url.open_base_url = True

c.scrolling.bar = 'always'
c.scrolling.smooth = True
c.keyhint.delay = 250
c.input.partial_timeout = 0
c.input.spatial_navigation = True

c.content.dns_prefetch = True # Use dns prefetching for speed

# Editor
c.editor.command = ['sensible-terminal', '-e', 'sensible-editor', '{}']
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.leave_on_load = True

# Hints
c.hints.auto_follow = 'always'
c.hints.chars = 'azsxdclmknjb'
c.hints.auto_follow = 'unique-match'
c.content.pdfjs = True

nunmap('<Ctrl-v>');
nunmap('<Ctrl-x>');
nunmap('<Ctrl-V>');
nunmap('<Ctrl-X>');

# Edit text and edit url
imap('<Ctrl-e>', 'open-editor')
nmap('<Ctrl-l>', 'edit-url')

nunmap("+")
nunmap("-")
nunmap("=")
nmap("z=", "zoom-in")
nmap("z-", "zoom-out")
nmap("zz", "zoom")

# Highlight inputs
nmap('gi', 'hint inputs')

# Add search
nmap('n', 'search-next')
nmap('N', 'search-prev')

# Clipboard play
nmap('yy', 'yank selection')   # Copy selected text
nmap('yu', 'yank')             # Copy url
nmap('yl', 'hint links userscript yank') # Copy a link from page as hints

# Add magnet link to download
c.aliases['find-torrent-magnet-links'] = 'hint links userscript torrent'
nmap('\\td', 'find-torrent-magnet-links')

nmap('<Ctrl+Shift+Down>', 'scroll-page 0 0.3')
nmap('<Ctrl+Shift+Up>',   'scroll-page 0 -0.3')
# }}}

#### UI {{{
c.fonts.default_family = 'Fira Code'
c.fonts.default_size = '12px'

## Hints
c.colors.hints.bg = 'yellow'
c.hints.border = '1px solid #000000'


## Context menu styles
c.colors.contextmenu.menu.bg = "#0f1215"
c.colors.contextmenu.menu.fg = "white"
c.colors.contextmenu.selected.bg = "#333333"
c.colors.contextmenu.selected.fg = "white"

## Completion
c.colors.completion.category.bg = "#000000"
c.colors.completion.even.bg = "#0f1215"
c.colors.completion.odd.bg = "#1f2225"
c.colors.completion.item.selected.bg = "#8ec07c"

## Tabs
c.tabs.padding = { 'bottom': 2, 'top': 2, 'left': 5, 'right': 5 }

## Unselected tabs
c.colors.tabs.even.bg = "#0f1215"
c.colors.tabs.even.fg = "white"
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg

## Selected tab
c.colors.tabs.selected.even.bg = '#505C95'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg

# Pinned tab
c.colors.tabs.pinned.even.bg = '#1f2225'
c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.odd.bg = '#1f2225'
c.colors.tabs.pinned.odd.fg = c.colors.tabs.odd.fg

c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

## Webpage styles
c.content.user_stylesheets = [
    "styles/scrollbar.css",
    "styles/default.css",
]
c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.bg = "white"

# Dark mode
c.aliases['dark-mode-toggle'] = 'config-cycle content.user_stylesheets \'' \
    + json.dumps(c.content.user_stylesheets) \
    + '\' \'' \
    + json.dumps(c.content.user_stylesheets + ['styles/dark.css']) \
    + '\''

nmap(',td', ':dark-mode-toggle');
# }}}

#### Sessions {{{
c.aliases['load'] = 'session-load -t';

# Sessions
nmap('\\sv', ':load video');
nmap('\\sc', ':load com');
# }}}

#### TABS {{{
c.tabs.show = 'multiple'
c.tabs.title.format = '{perc}{private} {audio}{index}: {current_title}'
c.tabs.tooltips = True
c.tabs.background = True
c.tabs.select_on_remove = 'next'
c.tabs.new_position.unrelated = 'next'
c.tabs.last_close = 'startpage' # 'close' for closing window on last d

# Keybindings
nmap('o', 'set-cmd-text -s :open --tab')
nmap('O', 'set-cmd-text -s :open')

# Tab
nmap('d', 'tab-close')

nmap('tt', 'open --tab')  # New tab
nmap('tp', 'open -p')     # Private window

# Tab movement
nmap('<Ctrl-PgUp>', 'tab-prev')
nmap('<Ctrl-PgDown>', 'tab-next')
nmap('<Ctrl-Shift-PgUp>', 'tab-move -')
nmap('<Ctrl-Shift-PgDown>', 'tab-move +')
nmap('b', 'set-cmd-text --space :buffer') # List buffers by index

# From clipboard
nmap('p', 'open --tab -- {clipboard}') # Open link in keyboard in a new tab
nmap('P', 'open -- {clipboard}') # Open link in clipboard in the same tab
# }}}

#### Downloads {{{
c.downloads.location.directory = '~/Downloads/qute'
c.downloads.location.prompt = False
c.downloads.open_dispatcher = 'dl_move {}'
c.downloads.position= 'bottom'
c.downloads.remove_finished = 1000

# Goto downloads directory 
nunmap('gd');
nmap('gdl', 'spawn --userscript open_downloads')

# Playing Videos with MPV
nmap('\\ty', 'spawn --detach bash -c "notify-send \\"Loading mpv\\" && mpv --force-window=immediate \\"{url}\\""')
# }}}

#### Security {{{
c.content.cookies.accept = 'no-3rdparty'
c.content.geolocation = 'ask'
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
c.content.host_blocking.enabled = True
c.content.media_capture = 'ask'
c.content.notifications = 'ask'
c.content.ssl_strict = 'ask'
c.content.desktop_capture = False
c.content.mouse_lock = False
c.content.xss_auditing = True
# c.content.canvas_reading = False
# }}}

#### Search and bookmarks {{{
# Default start page
c.url.default_page = '~/.config/qutebrowser/homepage/index.html'
c.url.start_pages = [c.url.default_page]

c.url.searchengines = \
    { 'DEFAULT': 'http://duckduckgo.com/?q={}',
     's': 'http://duckduckgo.com/?q={}',
     'g': 'https://www.google.com/search?q={}',
     'gh': 'http://github.com/search?q={}',
     'hg': 'http://www.haskell.org/hoogle/?hoogle={}',
     'aw': 'http://wiki.archlinux.org/index.php?search={}',
     'az': 'http://search.azlyrics.com/search.php?q={}',
     'r': 'http://www.reddit.com/r/{}/',
     'y': 'http://www.youtube.com/results?search_query={}',
    }

c.aliases['archive'] = 'open --tab http://web.archive.org/save/{url}'
c.aliases['view-archive'] = 'open --tab http://web.archive.org/web/*/{url}'
c.aliases['view-google-cache'] = 'open --tab http://www.google.com/search?q=cache:{url}'

c.aliases['xa'] = 'quit --save'
c.aliases['h'] = 'help'
# }}}

#### Dev {{{
nmap('\\tr', 'config-source')    # Reload config
nmap('\\ti', 'inspector')        # Inspector
nmap('\\ts', 'view-source')      # View page source

nmap('\\tj', 'spawn --userscript format_json') # Json formatter
# }}}

#### History {{{
nmap('<Alt-Left>', 'back')
nmap('<Alt-Right>', 'forward')
# }}}

