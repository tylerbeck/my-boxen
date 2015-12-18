class people::tylerbeck {

  $home     = "/Users/${::boxen_user}"
  $projects = "${home}/Projects"
  $configuration = "${home}/.config"
  $dotfiles = "${configuration}/dotfiles"
  $themes = "${dotfiles}/themes"

  # general setup ==============================================================
  file { $projects:
    ensure  => directory
  }

  # homebrew taps ==============================================================
  homebrew::tap { 'homebrew/dupes': }
  homebrew::tap { 'homebrew/science': }
  homebrew::tap { 'homebrew/completions': }
  homebrew::tap { 'homebrew/homebrew-apache': }
  homebrew::tap { 'homebrew/homebrew-php': }
  homebrew::tap { 'caskroom/versions': }

  # dotfiles ===================================================================
  repository { $dotfiles:
    source  => "tylerbeck/dotfiles",
    ensure   => 'origin/HEAD',
    require => File[$projects]
  }

  file { "${home}/.profile":
    ensure => "link",
    target => "${dotfiles}/profile",
    require => Repository[$dotfiles]
  }

  file { "${home}/.bash/":
    ensure => "link",
    target => "${dotfiles}/bash/",
    require => Repository[$dotfiles]
  }

  file { "${home}/.gitconfig":
    ensure => "link",
    target => "${dotfiles}/gitconfig",
    require => Repository[$dotfiles]
  }

  file { "/opt/boxen/user.sh":
    content => "export CONFIGURED_USER=${::boxen_user}\nexport CONFIGURED_HOST=${::hostname}\n"
  }


  # homebrew packages ==========================================================
  package { "bash-completion": }
  package { "node": }
  package { "docker": }
  package { "docker-machine": }

  # node & npm =================================================================
  exec { "install npm n":
    command => "npm install -g n",
    require => Package["node"]
  }

  exec { "install npm n stable":
    command => "n stable",
    require => Exec["install npm n"]
  }

  # terminal theme =============================================================
  $terminalTheme = "base16-default.dark"
  exec { "add theme to terminal":
    command => "open ${themes}/terminal/${terminalTheme}.terminal",
    require => Repository[$dotfiles]
  }

  exec { "set default theme for terminal":
    command => "defaults write /Users/${::boxen_user}/Library/Preferences/com.apple.Terminal.plist \"Default Window Settings\" \"${terminalTheme}\"",
    require => Exec["add theme to terminal"]
  }

  # atom =======================================================================
  atom::package{ 'atom-chai-snippets': }
  atom::package{ 'color-picker': }
  atom::package{ 'colorful-json': }
  atom::package{ 'dash': }
  atom::package{ 'docblockr': }
  atom::package{ 'editorconfig': }
  atom::package{ 'es-identifier-highlight': }
  atom::package{ 'file-icons': }
  atom::package{ 'language-javascript-better': }
  atom::package{ 'linter': }
  atom::package{ 'linter-jscs': }
  atom::package{ 'linter-eslint': }
  atom::package{ 'minimap': }
  atom::package{ 'minimap-git-diff': }
  atom::package{ 'open-recent': }
  atom::package{ 'pigments': }
  atom::package{ 'pretty-json': }

  atom::theme{ 'base16-syntax': }

  # casked apps ================================================================
  package { 'appcleaner': provider => 'brewcask' }
  package { 'controlplane': provider => 'brewcask' }
  package { 'daisydisk': provider => 'brewcask' }
  package { 'dockertoolbox': provider => 'brewcask' }
  package { 'firefox': provider => 'brewcask' }
  package { 'gitbox': provider => 'brewcask' }
  package { 'google-chrome': provider => 'brewcask' }
  package { 'graphicconverter': provider => 'brewcask' }
  package { 'kaleidoscope': provider => 'brewcask' }
  package { 'marked': provider => 'brewcask' }
  package { 'omnigraffle': provider => 'brewcask' }
  package { 'omnioutliner': provider => 'brewcask' }
  package { 'path-finder': provider => 'brewcask' }
  package { 'sketch-tool': provider => 'brewcask' }
  package { 'sketch': provider => 'brewcask' }
  package { 'squidman': provider => 'brewcask' }
  package { 'transmit': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }

}
