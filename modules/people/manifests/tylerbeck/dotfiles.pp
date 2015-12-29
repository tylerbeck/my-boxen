class people::tylerbeck::dotfiles {

  $home     = "/Users/${::boxen_user}"
  $project_dir = hiera('project_dir')
  $projects = "${home}/${project_dir}"
  $dotfiles = "${projects}/dotfiles"
  $sshconfig = "${home}/.ssh/config"

  file { $projects:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => "tylerbeck/dotfiles",
    ensure   => 'origin/HEAD',
    path => "$dotfiles",
    require => [ File[$projects] ]
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
    ensure => "present",
    source => "${dotfiles}/gitconfig",
    require => Repository[$dotfiles]
  }

  file { "${dotfiles}/bash/user.sh":
    content => "export CONFIGURED_USER=${::boxen_user}\nexport CONFIGURED_HOST=${::hostname}\n",
    require => Repository[$dotfiles]
  }
}
