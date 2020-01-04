"""Qutebrowser configuration"""
# * Pylint
# prevent pylint warnings and fix completion for c/config
# line too long
# pylint: disable = C0301
# E501 - line too long
# F401 - module imported but unused
# F821 - undefined name
# E0602 - undefined variable
# C0103 - invalid constant name
import os
import re
import sys
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401,E501 pylint: disable=unused-import
from qutebrowser.config.config import ConfigContainer  # noqa: F401,E501 pylint: disable=unused-import
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

# * Helper Functions
def bind(key, command, mode):  # noqa: E302
    """Bind key to command in mode."""
    # TODO set force; doesn't exist yet
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


# def cimap(key, command):
#     """Bind key to command in command mode and insert mode."""
#     cmap(key, command)
#     imap(key, command)


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


# * Settings
# ** Session
# always restore opened sites when opening qutebrowser
c.auto_save.session = True
c.session.lazy_restore = True

# ** Tabs
# open new tabs (middleclick/ctrl+click) in the background
c.tabs.background = True
# select previous tab instead of next tab when deleting current tab
c.tabs.select_on_remove = 'prev'
# open unrelated tabs after the current tab not last
c.tabs.new_position.unrelated = 'next'
#  c.tabs.min_width = 200

c.tabs.title.format = '{index}{private}{title_sep}{title}'

# ** Command Aliases
c.aliases['xa'] = 'quit --save'
c.aliases['h'] = 'help'

# ** Appearance
# *** General
c.fonts.monospace = 'Source Code Pro for Powerline'

# default but not transparent
c.colors.hints.bg = \
    'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 1), ' \
    + 'stop:1 rgba(255, 197, 66, 1))'

c.scrolling.bar = True

# lower delay for keyhint dialog (comparable to which-key)
c.keyhint.delay = 250

# c.tabs.padding = {"top": 2, "bottom": 2,  "left": 0, "right": 4}

# *** Pywal
colorsfile = os.path.expanduser('~/.cache/wal/qutebrowser_colors.py')
if os.path.isfile(colorsfile):
    config.source(colorsfile)

# ** Editor
c.editor.command = ['kitty', '-e', 'vim', '{}']

# ** Hints
# don't require enter after hint keys
c.hints.auto_follow = 'always'
c.hints.chars = 'arstdhneiowfpluy'

# ** Downloads
c.downloads.location.directory = '~/Downloads/qute'
c.downloads.location.prompt = False
c.downloads.open_dispatcher = 'dl_move {}'

# ** Security
# defaults
# c.content.cookies.accept = 'no-3rdparty'
# c.content.geolocation = 'ask'
# c.content.headers.do_not_track = True
# c.content.headers.referer = 'same-domain'
# c.content.host_blocking.enabled = True
# c.content.media_capture = 'ask'
# c.content.notifications = 'ask'
# c.content.ssl_strict = 'ask'

# content.javascript.can_access_clipboard
# content.headers.user_agent
# content.javascript.enabled
# content.pdfjs
# content.plugins
# content.proxy
# content.xss_auditing

# ** Input
# don't timeout for during partially entered command
c.input.partial_timeout = 0
# arrow key link element navigation; works okay on some pages
# unfortunately affects hnei too (move-to commands)
# c.input.spatial_navigation = True

# ** Home/Start Page
c.url.default_page = '~/.config/qutebrowser/homepage/index.html'
c.url.start_pages = [c.url.default_page]

# ** Search Keywords
c.url.searchengines = \
    { 'bt': 'http://bato.to/search?name_cond=c&name={}',
     'am': 'https://amazon.com/s?k={}',
     'aw': 'http://wiki.archlinux.org/index.php?search={}',
     'az': 'http://search.azlyrics.com/search.php?q={}',
     'd': 'http://duckduckgo.com/?q={}',
     'gh': 'http://github.com/search?q={}',
     'hg': 'http://www.haskell.org/hoogle/?hoogle={}',
     'j': 'http://jisho.org/search/{}',
     'r': 'http://www.reddit.com/r/{}/',
     'y': 'http://www.youtube.com/results?search_query={}',
     'DEFAULT': 'https://www.google.com/search?q={}',
    }

# ** Bookmarklets/Custom Commands
c.aliases['archive'] = 'open --tab http://web.archive.org/save/{url}'
c.aliases['view-archive'] = 'open --tab http://web.archive.org/web/*/{url}'
c.aliases['va'] = 'open --tab http://web.archive.org/web/*/{url}'
c.aliases['view-google-cache'] = 'open --tab http://www.google.com/search?q=cache:{url}'

# ** Media
#  c.content.autoplay = False

# ** Zoom
# decrease for HiDPI (necessary with QT_AUTO_SCREEN_SCALE_FACTOR=1)
if os.getenv('MONITOR_IS_HIDPI'):
    c.zoom.default = 67

# * Key Bindings
# ** Reload Configuration
nmap('t.', 'config-source')

# ** Miscellaneous Swaps
# swap ; and :
nmap(';', 'set-cmd-text :')
# nunmap(':')
hints_dict = dict()  # pylint: disable = C0103
for k, v in c.bindings.default['normal'].items():
    if k.startswith(';'):
        hints_dict[re.sub(r'^;(.*)', r':\1', k)] = v
c.bindings.commands['normal'].update(hints_dict)

# lose scroll left
nmap('h', 'back')
nmap('H', 'forward')

# lose scroll right
nmap('l', 'tab-focus last')

nmap('b', 'set-cmd-text --space :buffer')

# ** Colemak Swaps
# https://github.com/qutebrowser/qutebrowser/issues/2668#issuecomment-309098314
nmap('n', 'scroll-page 0 0.2')
nmap('e', 'scroll-page 0 -0.2')
nmap('N', 'tab-prev')
# no default binding
nmap('E', 'tab-next')

# add back search
nmap('k', 'search-next')
nmap('K', 'search-prev')

tmap('n', 'move-to-next-line')
tmap('e', 'move-to-prev-line')
tmap('i', 'move-to-next-char')
# add back e functionality
tmap('j', 'move-to-end-of-word')

tmap('N', 'scroll down')
tmap('E', 'scroll up')
tmap('I', 'scroll right')

# ** Hinting
# I think I like this better than going to first input
nmap('gi', 'hint inputs')
# TODO ts for download hinting instead of :d
# TODO ti for image hinting in background (rebind :inspector)

# ** Miscellaneous
nmap('gn', 'navigate previous')
nmap('ge', 'navigate next')

nmap('tm', 'messages --tab')
nmap('th', 'help --tab')
nmap('tr', 'stop')

# @: - run last ex command
nmap('t;','set-cmd-text : ;; completion-item-focus --history prev ;; '
     + 'command-accept')

# ** Tabs and Windows
nmap('o', 'set-cmd-text -s :open --tab')
nmap('O', 'set-cmd-text -s :open')

# open homepage in new tab
nmap('tt', 'open --tab')

# lose tab-only and download-clear
nmap('c', 'set-cmd-text :open --related {url:pretty}')
nmap('C', 'set-cmd-text :open --tab --related {url:pretty}')

# open new private window
nmap('tp', 'open -p')

# tn and te for tab moving
nmap('tn', 'tab-move -')
nmap('te', 'tab-move +')

# ** TODO Tabgroups
# - title should be displayed somewhere
# - create new group (vn)
# - move tab to different group (vM; vm - without switching)
# - switch to different group (vv completion)
# - keys for specific tap groups (e.g. wr,  prog, main, mango)
# - rename tab group (vr)
# - delete tab group (vd)

# ** Yanking and Pasting
# don't need primary or extra yanks
nmap('p', 'open --tab -- {clipboard}')
nmap('P', 'open -- {clipboard}')
nmap('y', 'yank')
nmap('Y', 'yank selection')

# ** Editor
imap('<Ctrl-i>', 'open-editor')
# open source in editor
nmap('gF', 'view-source')

# ** Insert/RL
#  imap('<Ctrl-w>', 'fake-key <Ctrl-backspace>')
#  imap('¸', 'fake-key <Ctrl-backspace>')
#  cmap('¸', 'fake-key --global <Ctrl-backspace>')

# nunmap('<Ctrl-w>')
# prevent c-w from closing tab
del c.bindings.default['normal']['<Ctrl-W>']

# C-y for pasting
imap('<Ctrl-y>', 'fake-key <Ctrl-v>')
cmap('<Ctrl-y>', 'fake-key --global <Ctrl-v>')

# ** Passthrough
nmap(',', 'enter-mode passthrough')
pmap('<Escape>', 'leave-mode')

# ** Undo
# no :undo completion currently
# nmap('U', 'set-cmd-text --space :undo')

# ** Quickmarks and Marks
nmap("'", 'set-cmd-text -s :quickmark-load --tab')
# nmap('B', 'set-cmd-text -s :bookmark-load --tab')
nmap("t'", 'set-cmd-text -s :bookmark-load --tab')

# add back mark jumping
nmap('"', 'enter-mode jump_mark')
nmap('tl', 'jump-mark "\'"')

# ** Spawn/Shell
# *** Bookarking with Buku
# can add tags after
nmap('m', 'set-cmd-text -s :spawn --detach buku --add "{url}"')

# *** Playing Videos with MPV
# "y" for youtube-dl
nmap('ty', 'spawn --detach mpv "{url}"')

# ** Downloads
# nmap -ex <leader>Y execute "silent !youtube-dl --restrict-filenames -o '~/move/%(title)s_%(width)sx%(height)s_%(upload_date)s.%(ext)s' " + buffer.URL + " &"
# nmap -ex <leader>A execute "silent !youtube-dl --restrict-filenames --extract-audio -o '~/move/%(title)s_%(width)sx%(height)s_%(upload_date)s.%(ext)s' " + buffer.URL + " &"
nmap('tw', 'download --dest ~/database/move/ ;; tab-close')
nmap('tg', 'spawn --detach dlg "{url}"')
nmap('td', 'download-open')
nmap('tr', 'spawn --detach dl_move bulk_store')
nmap('tc', 'download-clear')

# ** Zooming
nmap('zi', 'zoom-in')
nmap('zo', 'zoom-out')

# ** Inspector
nmap('ti', 'inspector')

