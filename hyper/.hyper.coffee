module.exports =
  plugins: [
    # 'hyperterm-material'
    'hyper-one-light'
    'hyperterm-overlay'
    'hyperline'
    'hyperlinks'
    'hypercwd'
    'hyperterm-themed-scrollbar'
    'hyperclean'
      # 'hyperterm-clicky'
    'hyperterm-alternatescroll'
    'hyperborder'
    'hyperminimal'
    'hyper-search'
    'hyper-blink'
  ]
  config:
    overlay:
      alwaysOnTop: true
      animate: false
      hasShadow: true
      hideOnBlur: false
      hotkeys: [ '`' ]
      position: 'top'
      primaryDisplay: false
      resizable: true
      startAlone: true
      startup: true
      size: 1
      tray: true
      unique: true
    hyperlinks:
      clickAction: 'open'
      defaultBrowser: true
    # clicky: editor: 'atom'
    # hyperTabs:
    #   trafficButtons: true
    #   tabIconsColored: true
    alternateScroll: scrollSpeed: 10
    hypercwd: initialWorkingDirectory: '~'
    updateChannel: 'canary'
    fontSize: 14
    fontFamily: '"Roboto Mono", "Lucida Console", monospace'
    cursorColor: 'rgba(248,28,229,0.8)'
    cursorShape: 'UNDERLINE'
    cursorBlink: false
    foregroundColor: '#fff'
    backgroundColor: '#000'
    borderColor: '#333'
    css: ''
    termCSS: ''
    showHamburgerMenu: 'false'
    showWindowControls: 'false'
    padding: '10px 10px'
    shell: ''
    shellArgs: [ '--login' ]
    env: {}
    bell: false
    copyOnSelect: true
  localPlugins: []
  keymaps:
    'tab:next': 'Ctrl+Alt+Tab'
    'tab:new': 'ctrl+shift+T'
    'tab:next': 'ctrl+alt+tab'
    'tab:prev': 'ctrl+shift+tab'
    'pane:splitVertical': 'Ctrl+Tab'
    'pane:next': 'Ctrl+Right'
    'pane:prev': 'Ctrl+Left'
    'window:toggleFullScreen': 'Alt+F'
    'editor:paste': 'Ctrl+V'
