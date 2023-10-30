## Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

## Disable loading autoconfig
config.load_autoconfig(False)

## My qutebrowser config file
import os
home = os.environ['HOME']
import qutebrowser
qutebrowser_version = qutebrowser.__version_info__

## Aliases
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save' }
c.aliases.update({'mail': 'open -t login.mailbox.org'})
c.aliases.update({'gmail': 'open -t mail.google.com'})
c.aliases.update({'github': 'open -t github.com'})
c.aliases.update({'gitlab': 'open -t gitlab.com'})
c.aliases.update({'netflix': 'open -t netflix.com'})
c.aliases.update({'twitter': 'open -t twitter.com'})
c.aliases.update({'tw': 'open -t twitter.com'})
c.aliases.update({'md': 'open -t mastodont.cat'})
c.aliases.update({'yt': 'open -t youtube.com/results?search_query='})
c.aliases.update({'imdb': 'open -t https://www.imdb.com/find?q='})
c.aliases.update({'iu': 'open -t yewtu.be/search?q='})
c.aliases.update({'pt': 'open -t tube.privacytools.io/search?search='})
c.aliases.update({'ht': 'open -t hooktube.com/results?search_query='})
c.aliases.update({'reddit': 'open -t https://libreddit.spike.codes/settings/restore/?theme=dark&front_page=default&layout=compact&wide=off&post_sort=hot&comment_sort=confidence&show_nsfw=on&use_hls=off&hide_hls_notification=off&subscriptions=Barca%2BCameras%2Bcatalunya%2Bdegoogle%2Bfuckcars%2Bfuji%2Bfujifilm%2Bfujix%2BFujixs10%2BGIMP%2Bjava%2Blearnrust%2Blinux%2Blinux_gaming%2Bmovies%2BNintendoSwitch%2Bprivacy%2BPrivacyGuides%2Bqutebrowser%2Brust%2Bsoccer%2BTrueAtheism%2BTrueFilm&filters='})
c.aliases.update({'ger': 'open -t https://dict.leo.org/german-english/'})
c.aliases.update({'cal': 'open -t https://office.mailbox.org/appsuite/#!!&app=io.ox/calendar&folder=cal://0/31&perspective=week:workweek'})
c.aliases.update({'calendar': 'open -t https://office.mailbox.org/appsuite/#!!&app=io.ox/calendar&folder=cal://0/31&perspective=week:workweek'})
c.aliases.update({'osm': 'open -t www.openstreetmap.org'})
c.aliases.update({'gmap': 'open -t maps.google.com'})

## Privacy / Seecurity
u_agent = 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
c.content.autoplay                  = False
c.content.canvas_reading            = False
c.content.headers.user_agent        = u_agent
c.content.register_protocol_handler = True
c.content.webgl                     = False
c.content.webrtc_ip_handling_policy = 'default-public-interface-only'
c.content.javascript.enabled        = True
c.content.local_storage             = True
c.content.plugins                   = True
c.content.geolocation               = 'ask'

## Adblocking
c.content.blocking.enabled       = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.method        = 'both'
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

## Cookies
c.content.cookies.accept = 'no-unknown-3rdparty'
c.content.cookies.store  = True

## Encoding
c.content.default_encoding = 'utf-8'

## Header
c.content.headers.accept_language = 'de,de-DE,en-US,en'
c.content.headers.do_not_track    = True
c.content.headers.referer         = 'same-domain'

## PDF
c.content.pdfjs = True

## Proxy
c.content.proxy = 'system'

## SSL
c.content.tls.certificate_errors = 'ask-block-thirdparty'

## Notifications
c.content.notifications.presenter = 'auto'
c.content.notifications.enabled   = True

## ShellCommand
terminal         = os.getenv("TERMINAL")
editor           = os.getenv("EDITOR")
c.editor.command = [terminal, "-e", editor, "-c", "normal {line}G{column0}l", "{file}"]

## Fonts
c.fonts.default_size     = '10pt'
c.fonts.default_family   = ["JetBrains Mono"]
c.fonts.prompts          = 'default_size default_family'
c.fonts.contextmenu      = 'default_size default_family'
c.fonts.completion.entry = 'default_size default_family'

## Hints
c.hints.border          = 'none'
# c.colors.hints.fg       = 'white'
# c.colors.hints.bg       = '#464f62'
# c.colors.hints.match.fg = '#ebcb8b'
c.keyhint.delay         = 250

## Scrollbar
c.scrolling.bar    = 'when-searching'
c.scrolling.smooth = True

## Tabs
c.tabs.favicons.scale         = 1
c.tabs.favicons.show          = 'always'
c.tabs.padding                = {'bottom': 3, 'left': 2, 'right': 2, 'top': 3}
c.tabs.position               = 'top'
c.tabs.title.alignment        = 'center'
c.tabs.indicator.width        = 3
c.tabs.indicator.padding      = {'bottom': 0, 'left': 0, 'right': 5, 'top': 0}
c.tabs.new_position.related   = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.select_on_remove       = 'prev'
c.tabs.last_close             = 'close'
c.tabs.show                   = 'multiple'
c.tabs.undo_stack_size        = 20

## Start pages
c.url.default_page = "https://www.google.de"
c.url.start_pages  = "https://www.google.de"

## Search engines
c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q={}'}
c.url.searchengines.update({'br': 'https://search.brave.com/search?q={}'})
c.url.searchengines.update({'searx': 'https://searx.be?q={}'})
c.url.searchengines.update({'ddg': 'https://duckduckgo.com/?q={}'})
c.url.searchengines.update({'sp': 'https://www.startpage.com/do/search?query={}'})
c.url.searchengines.update({'yt': 'https://youtube.com/results?search_query={}'})
c.url.searchengines.update({'tw': 'https://twitter.com/{}'})
c.url.searchengines.update({'aw': 'https://wiki.archlinux.org/?search={}'})
c.url.searchengines.update({'dh': 'https://hub.docker.com/search/?q={}&page=1&isAutomated=0&isOfficial=0&starCount=0&pullCount=0'})
c.url.searchengines.update({'wp': 'https://de.wikipedia.org/wiki/Special:Search?search={}&go=GO'})
c.url.searchengines.update({'rs': 'https://reddit.com/r/{}'})
c.url.searchengines.update({'r': 'https://www.reddit.com/search?q={}'})
c.url.searchengines.update({'man': 'https://man.archlinux.org/search?pkgname={}'})
c.url.searchengines.update({'gh': 'https://github.com/search?utf8=%E2%9C%93&q={}'})
c.url.searchengines.update({'rtfm': 'https://{}.rtfd.io'})
c.url.searchengines['rfc'] = 'https://tools.ietf.org/html/rfc{}'
c.url.searchengines['pypi'] = 'https://pypi.org/project/{}/'
c.url.searchengines['btc'] = 'https://www.blockchain.com/btc/address/{}'
c.url.searchengines['http'] = 'https://httpstatuses.com/{}'
c.url.searchengines['duden'] = 'https://www.duden.de/suchen/dudenonline/{}'
c.url.searchengines['dictcc'] = 'https://www.dict.cc/?s={}'

## Zoom
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

## Dark mode
c.colors.webpage.darkmode.enabled              = False
c.colors.webpage.darkmode.algorithm            = 'lightness-cielab'
c.colors.webpage.darkmode.contrast             = 0.0
c.colors.webpage.darkmode.grayscale.all        = False
c.colors.webpage.darkmode.grayscale.images     = 0.0
c.colors.webpage.darkmode.policy.images        = 'smart'
c.colors.webpage.darkmode.policy.page          = 'smart'
c.colors.webpage.darkmode.threshold.background = 128
c.colors.webpage.darkmode.threshold.text       = 128
c.colors.webpage.preferred_color_scheme        = 'dark'

## Bindings
config.bind('wi', 'devtools bottom')
config.bind('<Ctrl-0>', 'zoom 100')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('e', 'set-cmd-text :open {url:pretty}')
config.bind('<Ctrl-p>', 'set-cmd-text -s :open -p ')
config.bind('<Ctrl-e>', 'open-editor', mode='insert')
config.bind('V', 'hint links spawn mpv {hint-url}')
config.bind('A', 'hint links spawn mpv {hint-url} --no-video')
config.bind(';V', 'spawn foot yt-dlp --all-subs --output ~/tmp/%(title)s.%(ext)s {url}')
config.bind(';A', 'spawn foot yt-dlp --extract-audio --audio-format mp3 --output ~/tmp/%(title)s.%(ext)s {url}')
config.bind('t', 'hint userscript link translate')
config.bind('T', 'hint userscript all translate --text')
config.bind('<Ctrl+T>',        'spawn --userscript translate')
config.bind('<Ctrl+Shift+T>',  'spawn --userscript translate --text')
config.bind('tw', 'open -t https://twitter.com')
config.bind('td', 'open -t https://reddit.com')
config.bind('yo', 'open -t https://youtube.com')
config.bind('h', 'open')
config.bind('<Shift-Left>',     'back')
config.bind('<Shift-Down>',     'tab-next')
config.bind('<Shift-Up>',       'tab-prev')
config.bind('<Shift-Right>',    'forward')

## File handler
c.fileselect.handler             = "external"
c.fileselect.single_file.command = [
    terminal,
    "-a floating",
    "-e",
    "lf",
    "-selection-path",
    "{}",
]
c.fileselect.multiple_files.command = c.fileselect.single_file.command
c.fileselect.folder.command         = [
    terminal,
    "-a floating",
    "-e",
    "lf",
    "-command",
    "set dironly",
    "-last-dir-path",
    "{}",
]

## Auto saving
c.auto_save.session                 = False
c.auto_save.interval                = 60000
c.session.lazy_restore              = True

## Completion
c.completion.open_categories        = ['quickmarks','history','searchengines']
c.completion.quick                  = False
c.completion.scrollbar.padding      = 0
c.completion.scrollbar.width        = 8
c.completion.height                 = '30%'

## Statusbar
c.statusbar.padding                 = {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}
c.statusbar.widgets                 = ["keypress", "url", "scroll", "history", "tabs", "progress"]
c.statusbar.position                = 'bottom'

## Download
c.downloads.location.directory      = '~/downloads'
c.downloads.location.remember       = False
c.downloads.location.suggestion     = 'both'
c.downloads.position                = 'bottom'

## Input
c.input.insert_mode.auto_load       = False
c.input.insert_mode.leave_on_load   = True
c.input.escape_quits_reporter       = True
c.input.mouse.rocker_gestures       = True
c.input.partial_timeout             = 10000

## Misc
c.confirm_quit                      = ['multiple-tabs','downloads']
c.history_gap_interval              = 240
c.messages.timeout                  = 5000
c.new_instance_open_target          = 'tab'
c.url.open_base_url                 = True
c.window.hide_decoration            = True

## Theme
# config.source('theme/nord-qutebrowser.py')
config.source('gruvbox.py')
css = './gruvbox-all-sites.css'
config.bind(',d', 'config-cycle content.user_stylesheets ./gruvbox-all-sites.css ""')
c.content.user_stylesheets = './gruvbox-all-sites.css'
