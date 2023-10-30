# Qutebrowser's bindings

# Remove all default keys
c.bindings.default = {}

# Add a specific selectors (tries to select any frame)
c.hints.selectors['frame'] = ['div', 'header', 'section', 'nav']


bindings = """
normal
  <Escape>         clear-keychain ;; search ;; fullscreen --leave
  <Ctrl+c>         clear-keychain ;; search ;; fullscreen --leave
  <Ctrl+l>         clear-messages ;; download-clear
  /                set-cmd-text /
  ?                set-cmd-text ?
  :                set-cmd-text :
  !                set-cmd-text :open -t !
  o                set-cmd-text -s :open -s
  go               set-cmd-text :open {url:pretty}
  O                set-cmd-text -s :open -ts
  gO               set-cmd-text :open -t -r {url:pretty}
  J                tab-next
  K                tab-prev
  d                tab-close
  T                tab-focus
  tc               tab-clone
  tj               tab-move +
  tk               tab-move -
  tm               tab-mute
  tn               tab-next
  to               tab-only -f
  tp               tab-prev
  t0               tab-focus 1
  t$               tab-focus last
  g0               tab-focus 1
  g$               tab-focus -1
  <Ctrl+p>         tab-pin
  gt               set-cmd-text -s :tab-select
  r                reload
  <F5>             reload
  <Ctrl+r>         reload -f
  <Ctrl+F5>        reload -f
  <Ctrl+Shift+r>   restart
  H                back
  <Back>           back
  th               back -t
  L                forward
  <Forward>        forward
  tl               forward -t
  f                hint
  F                hint all tab
  ,H               hint --rapid all hover
  ,I               hint images tab
  ,d               hint links download
  ,f               hint frame
  ,h               hint all hover
  ,i               hint inputs
  ,o               hint links fill :open {hint-url}
  ,p               hint links userscript view_in_mpv
  ,r               hint --rapid links tab-bg
  ,y               hint links yank
  gi               hint inputs
  I                hint inputs --first
  h                scroll left
  j                scroll down
  k                scroll up
  l                scroll right
  u                undo
  gg               scroll-to-perc 0
  G                scroll-to-perc
  n                search-next
  N                search-prev
  i                mode-enter insert
  v                mode-enter caret
  V                mode-enter caret ;; selection-toggle --line
  <Shift+Escape>   mode-enter passthrough
  `                mode-enter set_mark
  '                mode-enter jump_mark
  yy               yank
  yt               yank title
  yd               yank domain
  yp               yank pretty-url
  ys               yank selection
  pp               set-cmd-text -- :open -- {clipboard}
  pP               set-cmd-text -- :open -t -- {clipboard}
  m                quickmark-save
  b                set-cmd-text -s :quickmark-load
  B                set-cmd-text -s :quickmark-load -t
  M                bookmark-add
  gb               set-cmd-text -s :bookmark-load
  gB               set-cmd-text -s :bookmark-load -t
  ss               set-cmd-text -s :set -t
  -                zoom-out
  +                zoom-in
  =                zoom
  {                navigate prev
  }                navigate next
  <Alt+Left>       navigate prev
  <Alt+Right>      navigate next
  <Ctrl+a>         navigate increment
  <Ctrl+x>         navigate decrement
  <Alt++>          navigate increment
  <Alt+->          navigate decrement
  wh               devtools left
  wj               devtools bottom
  wk               devtools top
  wl               devtools right
  ww               devtools window
  wf               devtools-focus
  gd               spawn -u -- jsdownload
  gD               download-cancel
  <Ctrl+u>         view-source
  <Ctrl+e>         view-source --edit
  ZQ               quit
  ZZ               quit --save
  <Ctrl+s>         stop
  <Ctrl+h>         history -t
  <Ctrl+m>         messages -w
  <Return>         selection-follow
  <Ctrl+Return>    selection-follow -t
  .                repeat-command
  q                macro-record
  @                macro-run
  cb               spawn -u -- domcycle content.javascript.can_access_clipboard
  cj               spawn -u -- domcycle content.javascript.enabled
  cJ               config-cycle -pt content.javascript.enabled ;; reload
  ci               spawn -u -- domcycle content.images
  cp               config-cycle -pt content.proxy system http://localhost:8080
  ct               config-cycle -t tabs.width 300 60
  cd               devtools
  gs               set-cmd-text -s -- :spawn -u substiqute
  gS               set-cmd-text -s -- :spawn -u substiqute -t
  gc               spawn -u -- gitclone
  gp               spawn -u -- view_in_mpv
  <Alt+l>          mode-enter insert ;; spawn -- bwm -b {url}
  <Alt+o>          mode-enter insert ;; spawn -- bwm -o {url}
  <Alt+p>          mode-enter insert ;; spawn -- bwm    {url}
  <Alt+u>          mode-enter insert ;; spawn -- bwm -u {url}

caret
  <Escape>         mode-leave
  q                mode-leave
  v                selection-toggle
  V                selection-toggle --line
  <Space>          selection-drop
  j                move-to-next-line
  k                move-to-prev-line
  l                move-to-next-char
  h                move-to-prev-char
  e                move-to-end-of-word
  w                move-to-next-word
  b                move-to-prev-word
  o                selection-reverse
  ]                move-to-start-of-next-block
  [                move-to-start-of-prev-block
  }                move-to-end-of-next-block
  {                move-to-end-of-prev-block
  0                move-to-start-of-line
  $                move-to-end-of-line
  gg               move-to-start-of-document
  G                move-to-end-of-document
  Y                yank selection -s
  y                yank selection
  <Return>         yank selection
  H                scroll left
  J                scroll down
  K                scroll up
  L                scroll right

command
  <Escape>         mode-leave
  <Ctrl+p>         command-history-prev
  <Ctrl+n>         command-history-next
  <Up>             completion-item-focus --history prev
  <Down>           completion-item-focus --history next
  <Shift+Tab>      completion-item-focus prev
  <Tab>            completion-item-focus next
  <Ctrl+Tab>       completion-item-focus next-category
  <Ctrl+Shift+Tab> completion-item-focus prev-category
  <PgDown>         completion-item-focus next-page
  <PgUp>           completion-item-focus prev-page
  <Ctrl+d>         completion-item-del
  <Shift+Del>      completion-item-del
  <Ctrl+c>         completion-item-yank
  <Ctrl+Shift+c>   completion-item-yank --sel
  <Return>         command-accept
  <Ctrl+Return>    command-accept --rapid
  <Ctrl+b>         rl-backward-char
  <Ctrl+f>         rl-forward-char
  <Alt+b>          rl-backward-word
  <Alt+f>          rl-forward-word
  <Ctrl+a>         rl-beginning-of-line
  <Ctrl+e>         rl-end-of-line
  <Ctrl+u>         rl-unix-line-discard
  <Ctrl+k>         rl-kill-line
  <Alt+d>          rl-kill-word
  <Ctrl+w>         rl-unix-word-rubout
  <Alt+Backspace>  rl-backward-kill-word
  <Ctrl+y>         rl-yank
  <Ctrl+?>         rl-delete-char
  <Ctrl+h>         rl-backward-delete-char

hint
  <Escape>         mode-leave
  q                mode-leave
  <Return>         hint-follow
  <Ctrl+r>         hint --rapid links tab-bg
  <Ctrl+f>         hint links
  <Ctrl+b>         hint all tab-bg

insert
  <Ctrl+e>         edit-text
  <Shift+Ins>      insert-text -- {primary}
  <Escape>         mode-leave
  <Shift+Escape>   fake-key <Escape>
  <Alt+l>          spawn -- bwm -b {url}
  <Alt+o>          spawn -- bwm -o {url}
  <Alt+p>          spawn -- bwm    {url}
  <Alt+u>          spawn -- bwm -u {url}

passthrough
  <Shift+Escape>   mode-leave
  <Alt+l>          spawn -- bwm -b {url}
  <Alt+o>          spawn -- bwm -o {url}
  <Alt+p>          spawn -- bwm    {url}
  <Alt+u>          spawn -- bwm -u {url}

prompt
  <Return>         prompt-accept
  <Ctrl+x>         prompt-open-download
  <Ctrl+p>         prompt-open-download --pdfjs
  <Shift+Tab>      prompt-item-focus prev
  <Up>             prompt-item-focus prev
  <Tab>            prompt-item-focus next
  <Down>           prompt-item-focus next
  <Alt+y>          prompt-yank
  <Alt+Shift+y>    prompt-yank --sel
  <Ctrl+b>         rl-backward-char
  <Ctrl+f>         rl-forward-char
  <Alt+b>          rl-backward-word
  <Alt+f>          rl-forward-word
  <Ctrl+a>         rl-beginning-of-line
  <Ctrl+e>         rl-end-of-line
  <Ctrl+u>         rl-unix-line-discard
  <Ctrl+k>         rl-kill-line
  <Alt+d>          rl-kill-word
  <Ctrl+w>         rl-unix-word-rubout
  <Alt+Backspace>  rl-backward-kill-word
  <Ctrl+?>         rl-delete-char
  <Ctrl+h>         rl-backward-delete-char
  <Ctrl+y>         rl-yank
  <Escape>         mode-leave

register
  <Escape>         mode-leave

yesno
  <Return>         prompt-accept
  y                prompt-accept yes
  n                prompt-accept no
  Y                prompt-accept --save yes
  N                prompt-accept --save no
  <Alt+y>          prompt-yank
  <Alt+Shift+y>    prompt-yank --sel
  <Escape>         mode-leave
"""

# Map all bindings
for line in bindings.splitlines():
    if line.strip():
        if line[0] != ' ':
            mode = line.strip()
            continue

        key, command = line.strip().split(' ', 1)
        config.bind(key, command.strip(), mode=mode)

