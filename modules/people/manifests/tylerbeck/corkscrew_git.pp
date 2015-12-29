class people::tylerbeck::corkscrew_git {

  $home     = "/Users/${::boxen_user}"
  $sshconfig = "${home}/.ssh/config"

  if !defined(Package['corkscrew']) {
    package { 'corkscrew':
      ensure => 'present'
    }
  }

  file { $sshconfig:
    ensure  => 'present',
    content => "Host github.com\n\tHostname ssh.github.com\n\tUser git\n\tPort 443\n\tProxyCommand \"corkscrew 127.0.0.1 3128 %h %p\"\n",
    require => [ Package['corkscrew'] ]
  }

}
