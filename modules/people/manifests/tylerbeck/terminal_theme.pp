class people::tylerbeck::terminal_theme {
  $home     = "/Users/${::boxen_user}"
  $project_dir = hiera('project_dir')
  $projects = "${home}/${project_dir}"
  $dotfiles = "${projects}/dotfiles"
  $themes = "${dotfiles}/themes"
  $terminalTheme = "base16-default.dark"

  exec { "add theme to terminal":
    command => "open ${themes}/terminal/${terminalTheme}.terminal",
    require => Repository[$dotfiles]
  }

  exec { "set default theme for terminal":
    command => "defaults write /Users/${::boxen_user}/Library/Preferences/com.apple.Terminal.plist \"Default Window Settings\" \"${terminalTheme}\"",
    require => Exec["add theme to terminal"]
  }

  exec { "set startup theme for terminal":
    command => "defaults write /Users/${::boxen_user}/Library/Preferences/com.apple.Terminal.plist \"Startup Window Settings\" \"${terminalTheme}\"",
    require => Exec["add theme to terminal"]
  }
}
