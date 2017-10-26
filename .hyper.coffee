

module.exports =
  plugins: [
    'hyperterm-material'
    'hyperterm-overlay'
    'hyperline'
    'hyperlinks'
    'hypercwd'
    'hyperterm-themed-scrollbar'
    'hyperclean'
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

    # hyperTabs:
    #   trafficButtons: true
    #   tabIconsColored: true
    alternateScroll: scrollSpeed: 3
    hypercwd: initialWorkingDirectory: '~'
    updateChannel: 'stable'
    fontSize: 14
    fontFamily: '"Roboto Mono", "Lucida Console", monospace'
    cursorColor: 'rgba(248,28,229,0.8)'
    cursorShape: 'BLOCK'
    cursorBlink: false
    foregroundColor: '#fff'
    backgroundColor: '#000'
    borderColor: '#333'
    css: ''
    termCSS: ''
    showHamburgerMenu: 'false'
    showWindowControls: 'false'
    padding: '16px 14px'
    shell: ''
    shellArgs: [ '--login' ]
    env: {}
    bell: false
    copyOnSelect: true
  localPlugins: []
  keymaps:
    'tab:next': 'Ctrl+Alt+Tab'
    'tab:new': 'Alt+X'
    'tab:next': 'ctrl+alt+tab'
    'tab:prev': 'ctrl+shift+tab'
    'pane:splitVertical': 'Ctrl+Tab'
    'pane:next': 'Ctrl+Right'
    'pane:prev': 'Ctrl+Left'
    'window:toggleFullScreen': 'Alt+F'
    'editor:paste': 'Ctrl+V'
