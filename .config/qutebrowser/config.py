"""Qutebrowser configuration"""
import os
import re
import sys
import json
import subprocess
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config = config
c = c

leader = '\\'
localleader = ' '

# Helper Functions {{{
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')
qute = read_xresources('qute')

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
c.content.autoplay = True
c.url.open_base_url = True

c.scrolling.bar = 'always'
c.scrolling.smooth = True
c.keyhint.delay = 250
c.input.partial_timeout = 0
c.input.spatial_navigation = False

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

nunmap('<Ctrl-v>')
nunmap('<Ctrl-x>')
nunmap('<Ctrl-V>')
nunmap('<Ctrl-X>')
nunmap('<Ctrl-h>')

# Edit text and edit url
imap('<Ctrl-e>', 'open-editor')
nmap('<Ctrl-l>', 'edit-url')

nunmap("+")
nunmap("-")
nunmap("=")
nmap("z=", "zoom-in")
nmap("z-", "zoom-out")
nmap("zz", "zoom")

# Add search
nmap('n', 'search-next')
nmap('N', 'search-prev')

# Clipboard play
nmap('yy', 'yank selection')   # Copy selected text
nmap('yu', 'yank')             # Copy url
nmap('yl', 'hint links userscript yank') # Copy a link from page as hints

# Add magnet link to download
c.hints.selectors['torrents'] = [ 'a[href^="magnet:"]' ]
c.aliases['find-torrent-magnet-links'] = 'hint torrents userscript torrent'
nmap(leader + 'td', 'find-torrent-magnet-links')

nmap('<Shift-j>', 'scroll-page 0 0.5')
nmap('<Shift-k>', 'scroll-page 0 -0.5')
# }}}

#### UI {{{
c.fonts.default_family = 'JetBrains Mono'
c.fonts.default_size = '12px'

## Hints
c.colors.hints.bg = 'yellow'
c.hints.border = '1px solid #000000'


#  c.colors.statusbar.normal.bg = xresources['*.background']
## Context menu styles
c.colors.contextmenu.menu.bg = xresources['*.background']
c.colors.contextmenu.menu.fg = xresources['*.foreground']
c.colors.contextmenu.selected.bg = xresources['*.accent']
c.colors.contextmenu.selected.fg = xresources['*.foreground']

## Completion
c.colors.completion.category.bg = xresources['*.background']
c.colors.completion.category.fg = xresources['*.accent']
c.colors.completion.even.bg = xresources['*.background']
c.colors.completion.odd.bg = xresources['*.color0']
c.colors.completion.item.selected.fg = xresources['*.foreground']
c.colors.completion.item.selected.bg = xresources['*.accent']
c.colors.completion.item.selected.border.bottom = xresources['*.accent']
c.colors.completion.item.selected.border.top = xresources['*.accent']
c.colors.statusbar.insert.bg = 'red'
c.colors.statusbar.insert.fg = 'white'

## Tabs
c.tabs.padding = { 'bottom': 2, 'top': 2, 'left': 5, 'right': 5 }

## Unselected tabs
c.colors.tabs.even.bg = xresources['*.background']
c.colors.tabs.even.fg = xresources['*.foreground']
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg

## Selected tab
c.colors.tabs.selected.even.bg = xresources['*.accent']
c.colors.tabs.selected.even.fg = xresources['*.foreground']
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg

# Pinned tab
c.colors.tabs.pinned.even.bg = xresources['*.background']
c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.odd.bg = xresources['*.background']
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

nmap(localleader + 'td', ':dark-mode-toggle');
# }}}

#### Sessions {{{
c.aliases['load'] = 'session-load -t';

# Sessions
nmap(leader + 'sv', ':load video');
nmap(leader + 'sc', ':load com');
# }}}

#### Navigation {{{

# Highlight inputs
nmap('gi', 'hint inputs')

# Selected
nmap(localleader + 'gl', 'follow-selected') # Follow selected link
nmap(localleader + 'gL', 'follow-selected --tab') # Follow selected link

# Increment pagination
nmap(localleader + 'nn', 'navigate increment')
nmap(localleader + 'nN', 'navigate decrement')

# From clipboard
nmap('p', 'open --tab -- {clipboard}') # Open link in keyboard in a new tab
nmap('P', 'open -- {clipboard}') # Open link in clipboard in the same tab

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

# Detach tab
nmap(leader + 'wt', 'tab-give')
nmap(leader + 'wp', 'tab-pin')

# Tab movement
nmap('<Ctrl-k>', 'tab-prev')
nmap('<Ctrl-j>', 'tab-next')
nmap('<Ctrl-Shift-k>', 'tab-move -')
nmap('<Ctrl-Shift-j>', 'tab-move +')
nmap('b', 'set-cmd-text --space :buffer') # List buffers by index

for i in range(1, 10 + 1):
    key = 0 if i == 10 else i
    nmap(localleader + str(key), 'tab-focus ' + str(i))

# }}}

#### Downloads {{{
c.downloads.location.directory = '~/Downloads/qute'
c.downloads.location.prompt = False
c.downloads.open_dispatcher = 'dl_move {}'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 1000
c.downloads.open_dispatcher = '~/.bin/open'

# c.qt.force_platformtheme='gtk3'

# Goto downloads directory
nunmap('gd')
nmap('gdl', 'spawn --userscript open_downloads')

# Playing Videos with MPV
nmap(leader + 'tyy', 'spawn --detach bash -c "notify-send \\"Loading mpv\\" && mpv --force-window=immediate \\"{url}\\""')

# Download music from youtube
nmap(leader + 'tym', 'spawn --userscript dl_music')
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
c.content.desktop_capture = 'ask'
c.content.mouse_lock = 'ask'
c.content.javascript.can_access_clipboard = True


c.aliases['tor-enable'] = 'set content.proxy "socks://localhost:9050"'
c.aliases['tor-disable'] = 'config-unset content.proxy'
c.aliases['tor-change'] = 'spawn --userscript tor_identity'
# }}}

#### Search and bookmarks {{{
# Default start page
c.url.default_page = '~/.config/qutebrowser/homepage/index.html'
c.url.start_pages = [c.url.default_page]

c.url.searchengines = {
    # General
    'sp': 'https://www.startpage.com/sp/search?q={}',
    'q': 'https://www.qwant.com/search?q={}',
    'd': 'http://duckduckgo.com/?q={}',
    'go': 'https://google.com/?q={}',

    # Dev stuff
    'bp': 'https://bundlephobia.com/result?p={}',
    'ciu': 'https://caniuse.com/#search={}',
    'g': 'https://github.com/{}',
    'gh': 'http://github.com/search?q={}',
    'hg': 'http://www.haskell.org/hoogle/?hoogle={}',
    'aw': 'http://wiki.archlinux.org/index.php?search={}',

    # Media
    'r': 'http://www.reddit.com/r/{}/',
    'y': 'http://www.youtube.com/results?search_query={}',
    'az': 'http://search.azlyrics.com/search.php?q={}',

    # Ignore
    'DEFAULT': 'http://this-is-a-placeholder.com?q={}',
}

# Default search engine
c.url.searchengines['DEFAULT'] = c.url.searchengines['d']
c.url.searchengines['s'] = c.url.searchengines['DEFAULT']

c.aliases['archive'] = 'open --tab http://web.archive.org/save/{url}'
c.aliases['view-archive'] = 'open --tab http://web.archive.org/web/*/{url}'
c.aliases['view-google-cache'] = 'open --tab http://www.google.com/search?q=cache:{url}'

#  c.aliases['xa'] = 'quit --save'
c.aliases['h'] = 'help'
# }}}

#### Dev {{{
nmap(leader + 'tr', 'config-source')    # Reload config
nmap(leader + 'ti', 'devtools window')  # Inspector
nmap(leader + 'ts', 'view-source')      # View page source

# Json formatter
c.aliases['format-json'] = 'spawn --userscript format_json';
nmap(leader + 'tj', 'format-json')
# }}}

#### History {{{
nmap('<Shift-h>', 'back')
nmap('<Shift-l>', 'forward')
nmap(leader + 'hh', 'history --tab')
# }}}
