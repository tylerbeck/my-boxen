class people::tylerbeck {

  include people::tylerbeck::dotfiles
  #include people::tylerbeck::taps
  #include people::tylerbeck::node
  # $home     = "/Users/${::boxen_user}"
  # $projects = "${::user::project_root}"
  # $configuration = "${::user::configuration_root}"
  # $dotfiles = "${configuration}/dotfiles"
  # $themes = "${dotfiles}/themes"

  # general setup ==============================================================
  # file { $projects:
  #   ensure  => directory
  # }

  # homebrew packages ==========================================================
  # node & npm =================================================================
  # terminal theme =============================================================


}
